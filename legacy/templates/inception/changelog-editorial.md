# CHANGELOG EDITORIAL
# AI Systems Engineering — Instancia Pedagógica
# ============================================================
# Registro de decisiones editoriales con justificación.
# No es un historial de git — es un registro de razonamiento.
# Cada entrada documenta qué cambió, por qué, qué lo motivó,
# y qué artefactos quedan afectados.
# ============================================================
# Formato de entrada:
#
# ## [FECHA] TIPO — Descripción breve
# **Motivación:** qué lo motivó — nota, análisis, conversación
# **Decisión:** qué se decidió exactamente
# **Alternativas consideradas:** qué otras opciones se evaluaron
# **Impacto:** qué artefactos quedan afectados
# **Próximos pasos:** qué decisiones dependientes se abren
# ============================================================

---

## [2026-03-10] INCEPTION — Definición de scope y objetivo

**Motivación:**
Conversación de diseño estratégico del proceso editorial completo.
El autor tiene material pedagógico existente (foundations/) y
experiencia como solution engineer en ciclo de vida completo
de proyectos empresariales complejos.

**Decisión:**
Instancia pedagógica como instancia origen. El objetivo pedagógico
es el más alineado con el perfil del autor y con el material
existente. El handbook de referencia técnica se define como
instancia derivada — transformación posterior de la instancia
pedagógica.

**Alternativas consideradas:**
- Instancias paralelas desde el mismo corpus de notas.
  Descartado: el flujo natural del autor va de pedagógico
  a referencia, no en paralelo.
- Único libro híbrido. Descartado: serve a nadie bien
  cuando los objetivos son suficientemente distintos.

**Impacto:**
- editorial-config.yml: instancia pedagógica como origen
- Índice: lógica emergente-desde-notas, no top-down
- Taxonomía: tipos pedagógicos, no tipos de handbook

**Próximos pasos:**
- Definir instancia-handbook con transformacion: pedagogico-a-referencia
- Establecer mecanismo de sincronización entre instancias

---

## [2026-03-10] INCEPTION — Definición de público objetivo

**Motivación:**
El perfil técnico base del público objetivo (Java, arquitecturas
contenerizadas) determina el punto de partida del conocimiento
y las transferencias peligrosas — analogías que son parcialmente
correctas y pueden llevar a decisiones erróneas.

**Decisión:**
Cuatro perfiles: Solution Architect, Senior Software Engineer,
Platform Engineer, AI Infrastructure Team. Todos son perfiles
técnicos senior con background en ingeniería de sistemas
empresariales. Ningún perfil de gestión — la propuesta de valor
del libro es técnica.

**Alternativas consideradas:**
- Incluir Engineering Manager. Descartado: la pregunta dominante
  de ese perfil es diferente en naturaleza, no solo en profundidad.
  Requeriría un libro distinto.
- Un solo perfil genérico "senior engineer". Descartado:
  los gaps y las preguntas dominantes son suficientemente
  distintos para justificar paths separados.

**Impacto:**
- paths/: cuatro ficheros de path
- Labs: variantes por perfil sobre escenarios compartidos
- Evaluación: criterios diferenciados por perfil en capítulos del núcleo

**Próximos pasos:**
- Definir secuencias completas de cada path en Phase 3
- Diseñar variantes de labs por perfil en Phase 5

---

## [2026-03-10] INCEPTION — Definición del perímetro de conocimiento del autor

**Motivación:**
El autor tiene experiencia como solution engineer con ciclo de
vida completo en proyectos empresariales complejos con base
técnica en Java y arquitecturas contenerizadas. Este perfil
produce una distribución asimétrica del conocimiento validable.

**Decisión:**
Tres niveles de validación según dominio:
- Alta confianza: decisiones arquitectónicas, ciclo de vida,
  fricción diseño-operación, patrones de fallo empresariales
- Media confianza: retrieval engineering, evaluation frameworks,
  platform engineering, observabilidad AI
- Requiere validación externa: seguridad AI, gobernanza regulatoria,
  infraestructura de inferencia especializada, agentes en producción

**Alternativas consideradas:**
- Excluir dominios fuera del perímetro. Descartado: algunos
  son críticos para el público objetivo y requieren validación
  externa en lugar de exclusión.
- Tratar todos los dominios igual. Descartado: deshonesto con
  el lector y con el proceso editorial.

**Impacto:**
- editorial-config.yml: sección autor completa
- ai-usage-policy.yml: etiquetado de origen de contenido
- Snapshots: declaración de nivel de confianza por capítulo

**Próximos pasos:**
- Identificar revisores externos para dominios críticos
- Definir qué capítulos de cada dominio son prioritarios

---

## [2026-03-10] INCEPTION — Definición de taxonomía de capítulos

**Motivación:**
El objetivo pedagógico con público de engineers senior requiere
tipos de capítulo distintos a los de un handbook de referencia.
El Field Pattern emerge como tipo diferencial — conocimiento
que solo existe en la práctica del autor.

**Decisión:**
Seis tipos: Concept Introduction, Worked Example, Practice Problem,
Synthesis, Field Pattern, Lab. Los tipos reflejan el objetivo
pedagógico y la naturaleza del conocimiento del autor.

**Alternativas consideradas:**
- Tipos del handbook (Architecture Pattern, Operational Guide...).
  Descartado: no se alinean con objetivo pedagógico.
- Un solo tipo genérico de capítulo. Descartado: distintos tipos
  de conocimiento requieren distintas estructuras para ser efectivos.

**Impacto:**
- config/chapter-types.yml: taxonomía completa con formatos
- Síntesis asistida: formato destino según tipo de capítulo
- Evaluación: criterios distintos por tipo

**Próximos pasos:**
- Clasificar capítulos del índice cuando esté disponible
- Diseñar prompts de síntesis por tipo de capítulo

---

## [2026-03-10] INCEPTION — Definición de fases y gates

**Motivación:**
El proceso necesita puntos de control explícitos — gates —
que impidan avanzar cuando los artefactos de la fase anterior
no cumplen los criterios de calidad. Sin gates, los problemas
del índice se descubren cuando ya hay contenido producido sobre él.

**Decisión:**
Diez etapas: Phase 0-7 más Gate 1 (Index Validation) y
Gate 2 (Content Review). Los gates son puntos de control,
no fases de producción — tienen criterios de entrada y salida
explícitos pero no producen artefactos nuevos.

**Alternativas consideradas:**
- Solo fases sin gates. Descartado: sin gates explícitos,
  los criterios de calidad se relajan bajo presión de avanzar.
- Gates después de cada fase. Descartado: exceso de fricción
  para fases de bajo riesgo como Migration.

**Impacto:**
- editorial-config.yml: sección fases completa
- Proceso: criterios de entrada a cada gate a definir

**Próximos pasos:**
- Desarrollar contenido completo de cada fase y gate
- Definir criterios explícitos de entrada y salida de cada gate

---

## [2026-03-10] INCEPTION — Política de uso de IA

**Motivación:**
El consumo de recursos de IA en esta conversación (5% del plan
pro semanal para diseño conceptual) pone de manifiesto que
el proceso necesita una política explícita de qué modelo usar
para qué operación. Sin política, el modelo grande se usa
para todo — incluyendo operaciones que no lo requieren.

**Decisión:**
Routing por tipo de operación: modelo grande para elicitación
y síntesis, modelo medio para evaluación, modelo pequeño para
clasificación, scripts sin IA para validación estructural.
Etiquetado obligatorio de origen de contenido.

**Impacto:**
- ai-usage-policy.yml: política completa por operación
- Presupuesto: distribución por fase documentada

**Próximos pasos:**
- Implementar scripts de validación estructural en Phase 1
- Diseñar prompts de evaluación reutilizables por tipo de capítulo

---
# FIN DE INCEPTION
# Próxima entrada esperada: inicio de Phase 1 — Migration
