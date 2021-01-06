## 12

Implementar el pseudo-código correspondiente para lograr la sincronización de cuatro procesos (P1, P2, P3 y P4) de forma que el mensaje del proceso P4 “Termina P4” se imprima por pantalla una vez que P1, P2 y P3 impriman sus mensajes respectivos de terminación. Para lograr la sincronización se deben emplear semáforos.

```c
int sem = 3;

void sem_post(int * sem){
    *sem--;
}

void sem_wait(int * sem){
    while(*sem != 0)
    { }
    *sem++;
}

Proceso P1() {
    
	int cont;
	for(cont=1;cont<=3;cont++) {
		S1;
	}
	printf(“Termina P1\n”);
    sem_post(&sem);
}

Proceso P2() {
	int cont;
	for(cont=1;cont<=3;cont++) {
		S2;
	}
	printf(“Termina P2\n”);
    
    sem_post(&sem);
}

Proceso P3() {
	int cont;
	for(cont=1;cont<=3;cont++) {
		S3;
	}
	printf(“Termina P3\n”);
    
    sem_post(&sem);
}

Proceso P4() {
    
    sem_wait(&sem);
    
	int cont;
	for(cont=1;cont<=3;cont++) {
		S4;
	}
	printf(“Termina P4\n”);
}
```

