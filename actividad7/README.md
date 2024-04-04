## Completely Fair Scheduler (CFS) de Linux

El Completely Fair Scheduler (CFS) es un algoritmo de planificación de procesos utilizado en el núcleo Linux desde la versión 2.6.23. Su objetivo principal es distribuir justamente el tiempo de procesador entre todos los procesos en ejecución, proporcionando una experiencia equitativa y sin discriminación para todos los usuarios y aplicaciones.

### Características principales:

1. **Equidad**: CFS busca proporcionar una cantidad justa de tiempo de CPU a cada proceso en ejecución. No discrimina entre procesos en términos de prioridad estática; en cambio, asigna cuotas de tiempo de CPU en función de la prioridad dinámica de los procesos y el tiempo que han pasado en estado de ejecución.

2. **Minimización de la latencia**: CFS minimiza la latencia del proceso, lo que significa que los procesos interactivos obtienen una respuesta rápida del sistema. Esto se logra mediante una detección eficiente de procesos que están listos para ejecutarse y garantizando que se les asigne tiempo de CPU de manera oportuna.

3. **Soporte para multiprocesadores**: CFS está diseñado para funcionar eficientemente en sistemas multiprocesador. Distribuye la carga de manera uniforme entre los núcleos del procesador, evitando la sobrecarga en un núcleo particular.

### Funcionamiento:

1. **Árbol de ejecución (red-black tree)**: CFS utiliza un árbol de ejecución red-black para mantener un seguimiento de todos los procesos en ejecución y sus respectivas prioridades. Este árbol facilita la búsqueda eficiente del próximo proceso para ser ejecutado.

2. **Prioridad dinámica**: Cada proceso tiene asignada una prioridad dinámica basada en su consumo histórico de CPU. Los procesos que utilizan menos CPU obtienen una prioridad más alta, lo que les permite obtener una mayor parte del tiempo de CPU.

3. **Asignación de tiempo de CPU**: CFS asigna tiempo de CPU a los procesos en función de sus cuotas de tiempo. Una cuota de tiempo es el tiempo que un proceso puede ejecutarse antes de ser reevaluado para su continuación. Los procesos con cuotas de tiempo más bajas obtienen prioridad para ejecutarse.

4. **Reevaluación continua**: CFS reevalúa constantemente la prioridad de los procesos en ejecución y ajusta sus cuotas de tiempo en función de su comportamiento de ejecución pasado. Esto garantiza que los procesos que utilizan menos CPU tengan prioridad para ejecutarse en el futuro.

5. **Previsión de ejecución (vruntime)**: CFS utiliza una métrica llamada vruntime para realizar un seguimiento del tiempo de ejecución de cada proceso. La vruntime representa el tiempo virtual que un proceso ha utilizado en el procesador. Los procesos con menor vruntime tienen prioridad para ser ejecutados.

En resumen, el Completely Fair Scheduler de Linux garantiza una distribución equitativa del tiempo de CPU entre todos los procesos en ejecución, minimizando la latencia y brindando una experiencia de usuario justa y eficiente en sistemas monoprocesador y multiprocesador.
