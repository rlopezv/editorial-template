# Prompt: Análisis del Corpus de Notas

## Cuándo usar este prompt

**Primera ejecución:** Al final de Phase 0 — Inception, Decision 7,
antes de generar el índice v0. El análisis del corpus es input
del prompt `generate-index-v0.md`.

**Ejecuciones incrementales:** Cada vez que se añaden notas nuevas
al corpus — durante Phase 3 (elicitación) o Phase 7 (mantenimiento).
En ejecuciones incrementales, pasar solo las notas nuevas y el
`analysis.yml` existente para actualización.

## Modelo recomendado

Large model. El análisis requiere leer el contenido completo
de cada nota e identificar fragmentos con precisión suficiente
para orientar la migración y el mapeo posterior.

## Cómo usar este prompt

1. Proporciona el contenido completo de cada nota — no solo títulos
2. Proporciona el scope del proyecto de `editorial-config.yml`
   para contextualizar qué es relevante y qué es ruido
3. En ejecuciones incrementales, incluye el `analysis.yml` existente
4. Guarda el output como `corpus/notes/analysis.yml`
5. Usa el output como input de `generate-index-v0.md`
   y de `plan-corpus-migration.md`

---

## PROMPT

```
Eres el asistente editorial de un libro técnico.
Tu tarea es analizar el corpus de notas del autor e identificar
con precisión qué contiene cada nota, qué dominios cubre,
y qué fragmentos específicos son relevantes para qué áreas del libro.

Este análisis es el input de dos operaciones posteriores:
1. Generación del índice v0 — para que el índice refleje
   lo que realmente existe en el corpus
2. Plan de migración — para decidir dónde va cada nota
   y si alguna debe fragmentarse antes de migrar

---

## SCOPE DEL PROYECTO

[RELLENAR — copiar scope.dominio.cubre y scope.dominio.no_cubre
de inception/editorial-config.yml]

---

## NOTAS A ANALIZAR

[RELLENAR — para cada nota, proporcionar el contenido completo]

### Nota: [nombre del fichero]
```
[contenido completo de la nota]
```

[repetir para cada nota]

---

## ANALYSIS.YML EXISTENTE (solo ejecuciones incrementales)

[RELLENAR — contenido del analysis.yml actual, o dejar vacío
si es la primera ejecución]

---

## INSTRUCCIONES DE ANÁLISIS

Para cada nota, analiza:

**Paso 1 — Dominio principal**
Qué área del scope cubre la mayor parte del contenido.
Expresado como el identificador de sección más probable del índice.

**Paso 2 — Dominios secundarios**
Qué otras áreas del scope toca la nota, aunque sea parcialmente.
Una nota puede tocar 0, 1, o varios dominios secundarios.

**Paso 3 — Fragmentos identificables**
Si la nota tiene secciones claramente distinguibles que pertenecen
a dominios distintos, identifícalas con suficiente precisión
para que el autor pueda localizarlas (título de sección,
primeras palabras del fragmento, o número de línea aproximado).

**Paso 4 — Recomendación de tratamiento**
Una de tres opciones:
- `migrar-integra`: el contenido mezclado es menor o inseparable,
  migrar la nota completa al dominio principal
- `fragmentar-antes`: hay fragmentos claramente separables de
  dominios distintos, vale la pena dividir la nota antes de migrar
- `meta`: la nota es un índice, mapa, o referencia cruzada del corpus —
  no es contenido en sí misma, va a `corpus/notes/meta/`

**Paso 5 — Conceptos principales**
Lista de los conceptos que la nota cubre con suficiente profundidad
para ser fuente de un capítulo. No incluir menciones de paso.

**Paso 6 — Nivel pedagógico**
- `introductorio`: asume poco conocimiento previo del dominio
- `intermedio`: asume conocimiento base del dominio
- `avanzado`: asume experiencia práctica en el dominio
- `operacional`: conocimiento tácito de práctica real — field pattern

**Paso 7 — Gaps detectados**
Conceptos del scope que la nota debería cubrir según su título
o contexto pero no cubre, o que cubre de forma insuficiente.

---

## FORMATO DE SALIDA

Produce el fichero `corpus/notes/analysis.yml` completo.

```yaml
# ============================================================
# CORPUS ANALYSIS
# ============================================================
# Análisis del contenido del corpus de notas.
# Generado en Phase 0 — Inception, actualizable incrementalmente.
# Input de: generate-index-v0.md, plan-corpus-migration.md,
#           map-notes-to-index.py
# ============================================================

meta:
  version: [v1 para primera ejecución, incrementar en sucesivas]
  ultima_actualizacion: [fecha]
  notas_analizadas: [número]
  fase: [phase-0-inception | phase-3-stabilization | phase-7-maintenance]

notas:

  - fichero: [nombre del fichero con extensión]
    dominio_principal: [id de sección — e.g. foundations]
    dominios_secundarios: [lista o null]
    tratamiento: migrar-integra | fragmentar-antes | meta
    nivel_pedagogico: introductorio | intermedio | avanzado | operacional

    conceptos_principales:
      - [concepto 1]
      - [concepto 2]

    fragmentos:                    # solo si tratamiento: fragmentar-antes
      - id: [nombre-fragmento]
        dominio: [dominio]
        ubicacion: >
          [descripción de dónde empieza y termina el fragmento
          — título de sección o primeras palabras]
        conceptos: [lista]

    gaps_detectados:               # conceptos ausentes o insuficientes
      - [gap 1]
      - [gap 2]

    notas_editoriales: >
      [Observaciones relevantes para Phase 2 — Alignment.
      Qué hace esta nota diferencial, qué nivel de detalle tiene,
      qué partes son más valiosas.]
```

---

## RESTRICCIONES

- Analiza solo el contenido que está en las notas — no inferas
  conocimiento que no está escrito
- Los gaps son ausencias reales, no deseos sobre lo que debería cubrir
- `fragmentar-antes` solo cuando los fragmentos son suficientemente
  largos y coherentes para existir como notas independientes
  — no fragmentes por fragmentar
- El nivel pedagógico es del contenido escrito, no del dominio en general
- En ejecuciones incrementales: no modifiques entradas existentes
  a menos que la nota haya cambiado — añade solo las notas nuevas

---

## Después de guardar analysis.yml

1. Revisar las recomendaciones `fragmentar-antes` — decidir cuáles ejecutar
2. Fragmentar las notas que lo requieran antes de continuar
3. Re-ejecutar el análisis sobre los fragmentos nuevos si los hay
4. Usar el analysis.yml como input de `generate-index-v0.md`
5. Documentar en `inception/changelog-editorial.md`:

```markdown
## [fecha] INCEPTION — Análisis del corpus completado

**Notas analizadas:** [número]
**Recomendaciones fragmentar-antes:** [número]
**Fragmentaciones ejecutadas:** [número]
**Gaps detectados:** [lista breve]
**Próxima acción:** generate-index-v0.md
```
```
