var http = require('http'), 
	events = require('events');
/**
 * create a CouchDB watcher based on connection criteria;
 * follows the Node.js EventEmitter pattern, emits 'change' events.
 */

exports.createWatcher = function(options) { 
	var watcher = new events.EventEmitter();
	
	watcher.host = options.host || 'localhost'; 
	watcher.auth =  options.auth || 'bd2:bd2';
	watcher.port = options.port || 5984; 
	watcher.last_seq = options.last_seq || 0; 
	watcher.db = options.db || '_users';

	watcher.start = function() {
		var httpOptions = { 
			host: watcher.host,
			 port: watcher.port, 
			 auth: watcher.auth,
			 path: '/' + watcher.db + '/_changes' + '?feed=longpoll&include_docs=true&since=' + watcher.last_seq
		};

		
		http.get(httpOptions, function(res) {
			var buffer = '';
			res.on('data', function (chunk) { buffer += chunk;});
			res.on('end', function() {
				var output = JSON.parse(buffer); 
				if (output.results) {
					watcher.last_seq = output.last_seq; 
					output.results.forEach(function(change){
						watcher.emit('change', change); });
						watcher.start(); 
					}
					else {
						watcher.emit('error', output); 
					}
				}) 
			})
		.on('error', function(err) { 
			watcher.emit('error', err);
		});
	
	};
	return watcher; 
};

// start watching CouchDB for changes if running as main script

if (!module.parent) { 
	exports.createWatcher({
		db: process.argv[2],
		last_seq: process.argv[3]
	})
	.on('change', console.log) 
	.on('error', console.error) 
	.start();
}
