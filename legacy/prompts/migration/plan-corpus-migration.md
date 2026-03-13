# Prompt: Plan de Migración del Corpus

## Cuándo usar este prompt

Al inicio de Phase 1 — Migration, antes de mover ningún fichero.
El autor revisa y aprueba el plan antes de ejecutar la migración física.

## Modelo recomendado

Medium model. Es una operación de clasificación, no de síntesis.
El razonamiento es sobre pertenencia temática — no requiere
capacidad de generación de contenido.

## Cómo usar este prompt

1. Lista todas las notas existentes con sus rutas actuales
2. Copia las secciones del índice v0 en la sección correspondiente
3. Ejecuta el prompt
4. Revisa los casos ambiguos antes de aprobar el plan
5. Ejecuta la migración física siguiendo el plan aprobado
6. Guarda el plan aprobado como `corpus/notes/migration-plan.yml`

---

## PROMPT

```
Eres el asistente editorial de un libro técnico.
Tu tarea es generar un plan de migración del corpus de notas —
qué nota va a qué directorio de dominio en el repositorio.

No mueves ficheros. Produces un plan que el autor revisa y aprueba
antes de ejecutar la migración física.

---

## NOTAS EXISTENTES

[RELLENAR — para cada nota:]

Fichero: [ruta o nombre actual]
Título o descripción: [título de la nota si existe]
Conceptos principales: [lista breve de los conceptos que cubre]

[repetir por cada nota]

---

## SECCIONES DEL ÍNDICE V0

[RELLENAR — lista de secciones con su descripción:]

Sección 1 — [Título]: [descripción breve]
Sección 2 — [Título]: [descripción breve]
[...]

Los directorios de dominio en corpus/notes/ corresponden a estas secciones.
El nombre del directorio es el identificador corto de la sección
(e.g. Section 1 — Foundations → foundations/).

---

## INSTRUCCIONES

Para cada nota, decide:

1. **Dominio principal** — a qué sección del índice pertenece
   el núcleo del contenido de la nota.

2. **Dominio secundario** (si aplica) — si la nota cubre
   contenido relevante para una segunda sección, decláralo.
   Una nota va a un solo directorio — el del dominio principal.
   El dominio secundario es información para Phase 2.

3. **Caso ambiguo** — si no puedes determinar el dominio principal
   con confianza, márcalo como ambiguo y explica por qué.
   El autor decide los casos ambiguos antes de ejecutar la migración.

4. **Nombre de fichero destino** — el nombre del fichero en el
   directorio destino. Usa el nombre original si es descriptivo.
   Si no lo es, propón un nombre en formato kebab-case descriptivo.

---

## FORMATO DE SALIDA

Produce el plan en dos partes:

### Parte 1 — Plan de migración

```yaml
migracion:
  - fichero_origen: [ruta actual]
    fichero_destino: corpus/notes/[dominio]/[nombre.md]
    dominio_principal: [id de sección]
    dominio_secundario: [id de sección o null]
    confianza: alta | media | ambiguo
    razon: >
      [Una frase explicando por qué pertenece a este dominio.
      Si es ambiguo, explicar qué hace difícil la clasificación.]
```

### Parte 2 — Directorios a crear

Lista de directorios `corpus/notes/[dominio]/` que deben crearse
antes de ejecutar la migración, en orden de ejecución:

```
mkdir -p corpus/notes/[dominio-1]
mkdir -p corpus/notes/[dominio-2]
[...]
```

### Parte 3 — Casos ambiguos (si existen)

Para cada caso ambiguo, presenta las opciones y la pregunta
concreta que el autor debe responder para decidir.

---

## RESTRICCIONES

- Cada nota va a exactamente un directorio
- No crees directorios que no correspondan a secciones del índice v0
- No renombres notas sin justificación — el nombre original
  es preferible si es descriptivo
- Si una nota es un índice o mapa pedagógico del corpus
  (no contenido en sí mismo), márcala con dominio: meta
  y destino: corpus/notes/meta/
```

---

## Después de aprobar el plan

1. Ejecuta los `mkdir -p` del plan
2. Copia cada nota a su destino (no muevas — copia primero para verificar)
3. Verifica que el contenido llegó íntegro
4. Elimina los originales
5. Guarda el plan aprobado:

```yaml
# corpus/notes/migration-plan.yml
version: v1
fecha: [fecha]
estado: ejecutado
notas_migradas: [número]
directorios_creados: [lista]
```

6. Actualiza `WORKFLOW.md` — marca Phase 1 en progreso
