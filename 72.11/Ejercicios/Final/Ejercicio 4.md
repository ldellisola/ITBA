# Ejercicio 4



```c
sem_t sem = 1;
int PesoMontacarga = 4;
bool TieneAutoGrande = false;

void AutoChico(){
    while(true){
        sem_wait(&sem);
        
        if(PesoMontacarga > 0){
            PesoMontagarga -= 1;
        }
        
        sem_post(&sem);
    }
}

void AutoGrande(){
    while(true){
        sem_wait(&sem);
        
        if(PesoMontacarga >= 2 && !TieneAutoGrande){
            PesoMontagarga -= 2;
            TieneAutoGrande = true;
        }
        
        sem_post(&sem);
    }
}

void MontaCargas(){
    while(true){
        sem_wait(&sem);
        
        if(PesoMontacarga == 0){
            PesoMontacarga = 4;
            TieneAutoGrande = false;
        }
        
        sem_post(&sem);
    }
}

```

