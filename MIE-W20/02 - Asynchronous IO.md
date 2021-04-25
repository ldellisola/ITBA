# Asynchronous IO

Asynchronous IO is a style of concurrent programming (not parallelism) that is single-threaded. It is composed by tasks running in an <u>event loop</u>. The tasks can be paused and reactivated when they recieve a result.

### Web Workers

Web workers are pieces of code that run on a worker thread.  Every worker runs in the event loop and they communicate via posting messages. They are thread-safe and can do anything except modifying the DOM.

Between the workers we can find **Dedicated Workers** that are accesible only by the scripts that created them, and then we have **Shared Workers** that are accesible by multiple scripts.

```js
// Main.js
var worker = new Worker('worker.js');

something.onchange = function () {
    worker.postMessage([value1,value2]);
}
// Worker.js
onmessage = function (e){
    console.log(e)
}
```

