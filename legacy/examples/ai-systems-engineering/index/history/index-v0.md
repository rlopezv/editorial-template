---
version: v0
instancia: pedagogica
estado: hipotesis-inicial
generado_en: phase-0-inception
fecha: 2026-03-10
logica: scope-completo-con-progresion-pedagogica
nota: >
  Este índice es una hipótesis inicial del territorio del libro.
  No es un compromiso sobre el contenido final.
  Será revisado en Phase 2 — Alignment contra el corpus de notas real.
  Los capítulos marcados como [P] son placeholders sin notas todavía.
  Los capítulos marcados como [N] tienen notas en el corpus actual.
capitulos_total: 68
secciones_total: 7
perfiles:
  - solution-architect
  - senior-software-engineer
  - platform-engineer
  - ai-infrastructure-team
---

# AI Systems Engineering
## Índice v0 — Hipótesis Inicial

---

## Cómo leer este índice

Este libro está diseñado para cuatro perfiles de ingeniería senior
con base técnica en Java y arquitecturas contenerizadas. Todos
comparten un núcleo conceptual común. Cada perfil tiene además
una secuencia especializada.

Los paths por perfil están definidos en `inception/config/paths/`.
Consulta tu path antes de empezar — te indica por dónde entrar
y qué capítulos son más críticos para tus decisiones.

**Leyenda:**
- `[N]` — tiene notas en el corpus actual
- `[P]` — placeholder, sin notas todavía
- `[SA]` — especialmente relevante para Solution Architects
- `[SSE]` — especialmente relevante para Senior Software Engineers
- `[PE]` — especialmente relevante para Platform Engineers
- `[AIT]` — especialmente relevante para AI Infrastructure Teams
- `[ALL]` — núcleo compartido por todos los perfiles

---

## Section 1 — Foundations
### El cambio de paradigma para ingenieros con base en sistemas clásicos

Esta sección establece el marco conceptual desde el que parte
el libro. No explica qué es la inteligencia artificial desde cero —
asume que el lector es un engineer senior. Explica qué cambia
fundamentalmente cuando introduces componentes probabilísticos
en sistemas que de otro modo conoces bien.

La progresión de esta sección va desde el marco general hacia
las restricciones concretas del modelo — porque entender las
restricciones es lo que permite diseñar sistemas que funcionan
en producción.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 01 | De sistemas determinísticos a sistemas probabilísticos — qué cambia realmente | concept-introduction | [ALL] | [N] |
| 02 | La anatomía de un sistema AI — componentes, artefactos, y dependencias | concept-introduction | [ALL] | [N] |
| 03 | Tipos de sistemas AI y sus implicaciones de diseño | concept-introduction | [ALL] | [N] |
| 04 | El paradigma Software 1.0 / 2.0 / LLM — por qué importa para un engineer Java | concept-introduction | [ALL] | [N] |
| 05 | ML clásico vs LLM systems — qué cambia en la arquitectura | concept-introduction | [ALL] | [N] |
| 06 | Tokens y contexto — las restricciones que condicionan todo el diseño | concept-introduction | [ALL] | [N] |
| 07 | Prompt engineering como disciplina de ingeniería | concept-introduction | [ALL] | [N] |
| 08 | Las limitaciones de los LLMs y por qué existen los sistemas que los rodean | concept-introduction | [ALL] | [N] |
| 09 | El ciclo de vida de un sistema AI — de diseño a operación continua | synthesis | [ALL] | [P] |
| 10 | Vocabulario compartido — los términos que los cuatro perfiles necesitan hablar igual | concept-introduction | [ALL] | [P] |

---

## Section 2 — Architecture
### Patrones de diseño y sus consecuencias

Esta sección introduce los patrones arquitectónicos de los sistemas
AI en producción. Para cada patrón, el foco no está en cómo
funciona en abstracto sino en qué implica para el engineer
que tiene que construirlo, operarlo, y mantenerlo.

La progresión va de lo simple a lo complejo — de sistemas de una
sola llamada a agentes autónomos — con énfasis en cuándo cada
patrón es la decisión correcta y cuándo no lo es.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 11 | Arquitecturas de referencia — el mapa del territorio | synthesis | [ALL] | [P] |
| 12 | Prompt-based systems — cuándo son suficientes y cuándo no | concept-introduction | [ALL] | [P] |
| 13 | RAG — diseño, variantes, y criterios de selección | concept-introduction | [ALL] | [P] |
| 14 | RAG en producción — lo que no está en los tutoriales | field-pattern | [SA] [SSE] [PE] | [P] |
| 15 | Workflow systems — orquestación determinística alrededor de modelos probabilísticos | concept-introduction | [ALL] | [P] |
| 16 | Tool use y function calling — contratos, fiabilidad, y gestión de errores | concept-introduction | [SSE] [SA] | [P] |
| 17 | Agent systems — capacidades, límites, y cuándo no usarlos | concept-introduction | [ALL] | [P] |
| 18 | Agentes en producción empresarial — patrones de fallo recurrentes | field-pattern | [SA] [PE] | [P] |
| 19 | Arquitecturas híbridas — combinando patrones para requisitos reales | worked-example | [SA] [SSE] | [P] |
| 20 | Decisiones arquitectónicas y sus consecuencias operacionales | field-pattern | [SA] | [P] |
| 21 | Cómo diseñar para ser evaluable — el error que se paga tarde | concept-introduction | [SA] [SSE] | [P] |

---

## Section 3 — Engineering Practices
### Construir bien en un sistema probabilístico

Esta sección es principalmente para Senior Software Engineers
y Solution Architects — cómo se construye correctamente
un sistema AI, qué cambia respecto a las prácticas de ingeniería
que el lector ya conoce, y qué prácticas nuevas son necesarias.

El énfasis está en la ingeniería del sistema que rodea al modelo
— no en el modelo mismo.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 22 | El prompt como artefacto de software — versionado, testing, y ciclo de vida | concept-introduction | [SSE] [SA] | [P] |
| 23 | Gestión de artefactos AI — prompts, embeddings, datasets, índices | concept-introduction | [SSE] [PE] | [P] |
| 24 | Retrieval pipeline engineering — chunking, embedding, y búsqueda | concept-introduction | [SSE] | [P] |
| 25 | Context assembly — construir el input correcto para el modelo | concept-introduction | [SSE] | [P] |
| 26 | Evaluation engineering — medir calidad en sistemas probabilísticos | concept-introduction | [ALL] | [P] |
| 27 | Datasets de evaluación — diseño, mantenimiento, y uso | concept-introduction | [SSE] [SA] | [P] |
| 28 | Testing de sistemas AI — qué funciona del testing clásico y qué no | concept-introduction | [SSE] | [P] |
| 29 | CI/CD para sistemas AI — qué cambia en el pipeline | concept-introduction | [SSE] [PE] | [P] |
| 30 | Gestión de regresiones — detectar cuando el sistema empeora | concept-introduction | [SSE] [PE] | [P] |
| 31 | Debugging de comportamiento inesperado en sistemas AI | worked-example | [SSE] | [P] |
| 32 | Seguridad en sistemas AI — prompt injection, data leakage, y surface de ataque | concept-introduction | [SSE] [SA] | [P] |

---

## Section 4 — Platform and Operations
### Operar sistemas AI en producción continua

Esta sección es principalmente para Platform Engineers y
AI Infrastructure Teams — cómo se sostiene un sistema AI
en producción, qué nueva infraestructura requiere, y qué
nuevos modos de fallo necesita gestionar.

El énfasis está en lo que es diferente respecto a operar
microservicios clásicos — que es lo que el lector ya sabe.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 33 | Qué hace diferente operar un sistema AI — los nuevos artefactos y los nuevos fallos | concept-introduction | [PE] [AIT] | [P] |
| 34 | Observabilidad de sistemas AI — más allá de logs, métricas y trazas | concept-introduction | [PE] [AIT] | [P] |
| 35 | Observabilidad semántica — medir calidad en producción | concept-introduction | [PE] | [P] |
| 36 | AI gateway y platform engineering — la capa que unifica el acceso | concept-introduction | [PE] [AIT] | [P] |
| 37 | Gestión del ciclo de vida de índices vectoriales | concept-introduction | [PE] [AIT] | [P] |
| 38 | Drift detection — cuándo un sistema que funciona deja de funcionar | concept-introduction | [PE] | [P] |
| 39 | Gestión de costes de tokens a escala | concept-introduction | [PE] [AIT] | [P] |
| 40 | SLOs para sistemas AI — qué se puede garantizar y qué no | concept-introduction | [PE] [SA] | [P] |
| 41 | Incident management para sistemas AI — los nuevos escenarios | concept-introduction | [PE] | [P] |
| 42 | Runbook — degradación silenciosa de calidad | operational-guide | [PE] | [P] |
| 43 | Runbook — fallo de retrieval pipeline en producción | operational-guide | [PE] | [P] |
| 44 | Runbook — coste de tokens fuera de presupuesto | operational-guide | [PE] [AIT] | [P] |

---

## Section 5 — Infrastructure
### La capa que determina qué arquitecturas son posibles

Esta sección es principalmente para AI Infrastructure Teams
— la infraestructura específica de sistemas AI, sus trade-offs
físicos y económicos, y cómo las decisiones de infraestructura
condicionan las decisiones de arquitectura y viceversa.

El énfasis está en la relación bidireccional entre infraestructura
y arquitectura — que es lo que los equipos de infraestructura
necesitan entender para no crear fricción con los equipos
de desarrollo.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 45 | Infraestructura de inferencia — GPU, KV-cache, batching, y quantization | concept-introduction | [AIT] | [P] |
| 46 | Opciones de serving — cloud APIs vs self-hosted — trade-offs reales | concept-introduction | [AIT] [SA] | [P] |
| 47 | Vector database infrastructure — arquitectura, sizing, y operación | concept-introduction | [AIT] [PE] | [P] |
| 48 | Embedding service infrastructure — throughput, latencia, y coste | concept-introduction | [AIT] | [P] |
| 49 | Networking para sistemas AI — latencia y ancho de banda como restricciones de diseño | concept-introduction | [AIT] | [P] |
| 50 | Storage para artefactos AI — modelos, índices, embeddings, datasets | concept-introduction | [AIT] [PE] | [P] |
| 51 | Capacity planning para cargas de trabajo AI | concept-introduction | [AIT] | [P] |
| 52 | Auto-scaling para inferencia — los límites del scaling clásico | concept-introduction | [AIT] | [P] |
| 53 | Cómo las decisiones de infraestructura determinan los SLOs posibles | field-pattern | [AIT] [SA] | [P] |

---

## Section 6 — Enterprise Patterns
### El conocimiento que solo existe en proyectos reales

Esta sección es el núcleo diferencial del libro — el conocimiento
que no está en ningún paper ni documentación porque solo emerge
de haber construido y operado sistemas AI en organizaciones
empresariales reales con todas sus restricciones.

Los capítulos de esta sección son principalmente Field Patterns
y Case Studies. Son los más difíciles de escribir y los más
valiosos para el lector.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 54 | Cómo las decisiones de diseño tempranas crean deuda operacional | field-pattern | [SA] [SSE] | [P] |
| 55 | La brecha entre el PoC y el sistema en producción — por qué existe y cómo acortarla | field-pattern | [SA] [SSE] | [P] |
| 56 | Stakeholder management en proyectos AI — las conversaciones que no están en los libros | field-pattern | [SA] | [P] |
| 57 | Cuándo los patterns de microservicios se transfieren y cuándo no | field-pattern | [SSE] [SA] | [P] |
| 58 | El patrón de sobreingeniería temprana en sistemas AI | field-pattern | [SA] [SSE] | [P] |
| 59 | Evaluación como negociación con stakeholders — las métricas que importan fuera de engineering | field-pattern | [SA] | [P] |
| 60 | Gestión de expectativas sobre comportamiento no determinístico | field-pattern | [SA] | [P] |
| 61 | Cómo los requisitos de compliance cambian la arquitectura | field-pattern | [SA] [AIT] | [P] |
| 62 | La deuda de observabilidad — cuando el sistema crece más rápido que la visibilidad | field-pattern | [PE] [SSE] | [P] |

---

## Section 7 — Reference Architectures and Case Studies
### Sistemas completos y decisiones en contexto real

Esta sección presenta arquitecturas completas de sistemas AI
reales — con sus decisiones de diseño, su racionalidad,
y sus consecuencias. No son casos de éxito — son casos
honestos que incluyen lo que falló y lo que se haría diferente.

| # | Título | Tipo | Perfiles | Estado |
|---|--------|------|----------|--------|
| 63 | Enterprise knowledge assistant — RAG sobre documentación interna | reference-architecture | [ALL] | [P] |
| 64 | Document analysis pipeline — extracción estructurada a escala | reference-architecture | [SSE] [SA] | [P] |
| 65 | Coding assistant integrado en el SDLC — más allá del autocomplete | reference-architecture | [SSE] [SA] | [P] |
| 66 | Customer support con escalado inteligente — cuando el agente no puede | reference-architecture | [SA] [PE] | [P] |
| 67 | Migración de un sistema basado en reglas a un sistema AI — decisiones y trade-offs | case-study | [SA] [SSE] | [P] |
| 68 | Recuperación de un sistema AI que degradó silenciosamente en producción | case-study | [PE] [SA] | [P] |

---

## Mapa de progresión pedagógica

```
Section 1 — Foundations
    ↓ todos los perfiles
Section 2 — Architecture
    ↓ todos los perfiles
    ├── Section 3 — Engineering Practices
    │       ↓ SA + SSE principalmente
    ├── Section 4 — Platform and Operations
    │       ↓ PE + AIT principalmente
    └── Section 5 — Infrastructure
            ↓ AIT principalmente
Section 6 — Enterprise Patterns
    ↓ todos los perfiles
Section 7 — Reference Architectures
    ↓ todos los perfiles
```

Las secciones 3, 4, y 5 se pueden leer en paralelo o en cualquier
orden después de las secciones 1 y 2. Los paths por perfil
especifican la secuencia recomendada para cada lector.

---

## Estado del corpus actual

| Sección | Capítulos | Con notas [N] | Placeholders [P] |
|---------|-----------|---------------|-----------------|
| 1 — Foundations | 10 | 8 | 2 |
| 2 — Architecture | 11 | 0 | 11 |
| 3 — Engineering Practices | 11 | 0 | 11 |
| 4 — Platform and Operations | 12 | 0 | 12 |
| 5 — Infrastructure | 9 | 0 | 9 |
| 6 — Enterprise Patterns | 9 | 0 | 9 |
| 7 — Reference Architectures | 6 | 0 | 6 |
| **Total** | **68** | **8** | **60** |

---

## Señales de revisión conocidas en v0

Las siguientes señales se identificaron durante la generación
de este índice v0 y deberán resolverse en Phase 2 — Alignment:

**Posible solapamiento:**
- Ch04 (Software 1.0/2.0) y Ch05 (ML vs LLM) pueden fusionarse
  si el mapeo de notas confirma que las notas existentes
  los tratan como un solo concepto.

**Posible gap de granularidad:**
- Section 6 — Enterprise Patterns tiene alta densidad de
  Field Patterns. En Phase 3 puede crecer significativamente
  con material de elicitación — o puede consolidarse si
  los patrones son más interdependientes de lo que parece ahora.

**Dominio sin cobertura de notas:**
- Secciones 2-7 completas. La cobertura actual es exclusivamente
  de foundations. El índice refleja el scope completo —
  Phase 2 confirmará qué tiene cobertura real en el corpus.

---
*Índice v0 generado en Phase 0 — Inception*
*Próxima revisión: Phase 2 — Alignment*
*Changelog: ver inception/changelog-editorial.md*
