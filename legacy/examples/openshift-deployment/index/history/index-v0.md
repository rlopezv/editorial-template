---
version: v0
instancia: operacional
estado: hipotesis-inicial
generado_en: phase-0-inception
fecha: ""
logica: framework-conceptual-del-autor
nota: >
  Este índice es una hipótesis inicial generada en Phase 0
  sin corpus de notas previo. Representa la estructura del dominio
  según el framework conceptual del autor — no un índice validado
  contra material escrito.
  Será revisado en Phase 2 — Alignment.
  Los capítulos marcados como [E] tienen notas de elicitación de Phase 0.
  Los capítulos marcados como [P] son placeholders sin material todavía.
capitulos_total: 0
secciones_total: 0
perfiles:
  - devops-engineer
  - platform-engineer
  - operations-engineer
nota_sobre_phase1: >
  Phase 1 — Migration no aplica a este proyecto.
  No hay corpus de notas previo para migrar.
  Tras Phase 0, pasar directamente a Phase 2 — Alignment
  para revisar este índice contra las notas de elicitación generadas.
---

# OpenShift Deployment
## Índice v0 — Hipótesis Inicial

---

## Cómo leer este índice

Este libro está diseñado para tres perfiles de ingeniería
que trabajan con aplicaciones sobre OpenShift:

- **DevOps / SRE Engineer** — responsable del ciclo CI/CD completo
  y de la automatización y observabilidad de sus aplicaciones.
  *Pregunta dominante: ¿Cómo automatizo, observo y mantengo mis aplicaciones?*

- **Platform Engineer** — responsable de la plataforma sobre la que
  otros equipos despliegan. Ve el clúster como un producto interno.
  *Pregunta dominante: ¿Cómo opero la plataforma para que los equipos sean autónomos?*

- **Operations Engineer** — responsable de mantener el servicio
  en producción y de responder cuando algo falla.
  *Pregunta dominante: ¿Cómo mantengo el servicio y respondo a incidentes?*

El libro está organizado con una progresión secuencial recomendada
para la primera lectura, con secciones especializadas al final de cada
perfil para profundización posterior.

---

## Leyenda

| Marca | Significado |
|-------|-------------|
| `[E]` | Capítulo con notas de elicitación de Phase 0 |
| `[P]` | Placeholder — pendiente de elicitación en Phase 4 |

---

## Sección 1 — El modelo de OpenShift para quien llega de fuera

> Establece el modelo mental de OpenShift para los tres perfiles de lector.
> Qué existe en el clúster desde la perspectiva de quien despliega aplicaciones,
> qué ha cambiado respecto a entornos clásicos, y por qué el modelo de seguridad
> de OpenShift cambia muchas de las prácticas conocidas.
>
> Esta sección es el punto de entrada para los tres perfiles.
> No asume experiencia previa con Kubernetes.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 1.1 | [P] Del proceso al pod — qué cambia cuando la infraestructura es inmutable | concept-introduction | todos | [P] |
| 1.2 | [P] El namespace como unidad de trabajo — proyectos, tenancy y acceso | concept-introduction | todos | [P] |
| 1.3 | [P] El modelo de seguridad de OpenShift — SCC, por qué existe y qué rompe | concept-introduction | todos | [P] |
| 1.4 | [P] Pods, Deployments y ReplicaSets — el ciclo de vida de una aplicación | concept-introduction | todos | [P] |
| 1.5 | [P] Services y Routes — cómo se expone una aplicación en OpenShift | concept-introduction | todos | [P] |
| 1.6 | [P] ConfigMaps y Secrets — gestión de configuración en entornos inmutables | concept-introduction | todos | [P] |
| 1.7 | [P] El modelo de recursos — requests, limits y por qué importan | concept-introduction | todos | [P] |
| 1.8 | [P] Synthesis — el modelo completo: qué hay en el clúster y cómo interactúa | synthesis | todos | [P] |

---

## Sección 2 — Desplegar y operar aplicaciones

> El ciclo de vida completo de una aplicación sobre OpenShift.
> Desde el primer despliegue hasta la operación continuada.
> Énfasis en las decisiones que determinan la operabilidad posterior.
>
> Orientada principalmente al DevOps / SRE Engineer con contenido
> relevante para los otros dos perfiles.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 2.1 | [P] El primer despliegue — de la imagen al pod en producción | worked-example | devops | [P] |
| 2.2 | [P] Estrategias de despliegue — RollingUpdate, Recreate y cuándo elegir cada una | concept-introduction | devops | [P] |
| 2.3 | [P] Health checks — liveness, readiness y startup probes | concept-introduction | devops, ops | [P] |
| 2.4 | [P] Gestión de secretos — patrones seguros en OpenShift | concept-introduction | devops, platform | [P] |
| 2.5 | [P] La imagen que funciona en local y falla en el clúster | field-pattern | devops | [P] |
| 2.6 | [P] Despliegue multi-entorno — dev, staging, producción con la misma base | worked-example | devops | [P] |
| 2.7 | [P] Rollbacks — cuándo y cómo revertir un despliegue | concept-introduction | devops, ops | [P] |
| 2.8 | [P] Practice problem — diagnosticar un pod que no arranca | practice-problem | todos | [P] |
| 2.9 | [P] Synthesis — el ciclo de vida de una aplicación en producción | synthesis | todos | [P] |

---

## Sección 3 — Observabilidad de aplicaciones

> Qué ocurre dentro del clúster y cómo observarlo.
> Métricas, logs, eventos y alertas desde la perspectiva
> de quien gestiona aplicaciones — no de quien administra el clúster.
>
> Relevante para DevOps y Operations Engineer principalmente.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 3.1 | [P] El modelo de observabilidad de OpenShift — qué hay disponible y qué no | concept-introduction | devops, ops | [P] |
| 3.2 | [P] Logs de aplicación — dónde están y cómo consultarlos | concept-introduction | todos | [P] |
| 3.3 | [P] Métricas de aplicación — exponer y consumir métricas de Prometheus | concept-introduction | devops | [P] |
| 3.4 | [P] Eventos del clúster — qué son y cómo leerlos en un incidente | concept-introduction | ops | [P] |
| 3.5 | [P] Alertas de aplicación — definir y gestionar alertas en OpenShift | concept-introduction | devops, ops | [P] |
| 3.6 | [P] El pod que consume memoria silenciosamente hasta el OOMKill | field-pattern | ops | [P] |
| 3.7 | [P] Cuadro de mando operacional — qué métricas definen el estado del servicio | worked-example | ops | [P] |
| 3.8 | [P] Practice problem — diagnosticar degradación de rendimiento sin errores visibles | practice-problem | devops, ops | [P] |

---

## Sección 4 — Pipelines y automatización

> CI/CD sobre OpenShift con Tekton y OpenShift Pipelines.
> El paradigma declarativo de pipelines como código y su
> operación en un entorno multiequipo.
>
> Orientada principalmente al DevOps / SRE Engineer y al Platform Engineer.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 4.1 | [P] Tekton — el paradigma declarativo y por qué es distinto de Jenkins | concept-introduction | devops | [P] |
| 4.2 | [P] Tasks, Pipelines y PipelineRuns — los objetos fundamentales | concept-introduction | devops | [P] |
| 4.3 | [P] Workspaces y almacenamiento en pipelines — cómo persiste el estado | concept-introduction | devops | [P] |
| 4.4 | [P] El primer pipeline funcional — build, push y deploy | worked-example | devops | [P] |
| 4.5 | [P] Gestión de secretos en pipelines — acceso a registry y repositorios | concept-introduction | devops, platform | [P] |
| 4.6 | [P] Triggers — activar pipelines desde eventos externos | concept-introduction | devops | [P] |
| 4.7 | [P] El pipeline que funciona una vez y falla la segunda | field-pattern | devops | [P] |
| 4.8 | [P] Pipelines de múltiples equipos sobre la misma plataforma | worked-example | platform | [P] |
| 4.9 | [P] Practice problem — diseñar un pipeline para una aplicación con requisitos de seguridad | practice-problem | devops, platform | [P] |

---

## Sección 5 — Seguridad operacional

> El modelo de seguridad de OpenShift en profundidad.
> SCC, RBAC, network policies y gestión de secretos a escala.
> Orientada a Platform Engineer y DevOps con contenido de diagnóstico
> para Operations Engineer.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 5.1 | [P] SCC en profundidad — qué controlan, cómo se asignan, cuándo hacer excepciones | concept-introduction | platform, devops | [P] |
| 5.2 | [P] RBAC de aplicación — permisos por namespace en entornos multiequipo | concept-introduction | platform | [P] |
| 5.3 | [P] Network policies — aislamiento de aplicaciones y gestión del tráfico | concept-introduction | platform, devops | [P] |
| 5.4 | [P] Gestión de secretos a escala — External Secrets Operator y Vault | worked-example | platform | [P] |
| 5.5 | [P] El SCC que silencia el contenedor sin mensaje de error | field-pattern | devops, platform | [P] |
| 5.6 | [P] Synthesis — el modelo de seguridad completo: quién puede hacer qué y por qué | synthesis | platform | [P] |

---

## Sección 6 — Escalado y capacidad

> Autoscaling de aplicaciones, gestión de recursos y capacidad
> desde la perspectiva de los equipos de aplicación.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 6.1 | [P] Resource requests y limits — el contrato con el scheduler | concept-introduction | todos | [P] |
| 6.2 | [P] Horizontal Pod Autoscaler — configuración y operación | concept-introduction | devops, platform | [P] |
| 6.3 | [P] La aplicación que escala pero no mejora — antipatrones de HPA | field-pattern | devops | [P] |
| 6.4 | [P] Cuotas y límites por namespace — el contrato entre equipos | concept-introduction | platform | [P] |
| 6.5 | [P] Practice problem — dimensionar una aplicación para picos de carga | practice-problem | devops, platform | [P] |

---

## Sección 7 — Troubleshooting y respuesta a incidentes

> Diagnóstico sistemático de fallos en aplicaciones sobre OpenShift.
> Runbooks para los modos de fallo más comunes.
> Orientada principalmente al Operations Engineer y al DevOps.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 7.1 | [P] Metodología de diagnóstico — qué mirar primero y en qué orden | concept-introduction | ops, devops | [P] |
| 7.2 | [P] Pod en CrashLoopBackOff — diagnóstico y resolución | worked-example | ops | [P] |
| 7.3 | [P] Pod en Pending — diagnóstico cuando el scheduler no encuentra nodo | worked-example | ops, platform | [P] |
| 7.4 | [P] ImagePullBackOff — diagnóstico de problemas de acceso a registry | worked-example | ops, devops | [P] |
| 7.5 | [P] OOMKilled — diagnóstico y respuesta | worked-example | ops, devops | [P] |
| 7.6 | [P] El incidente que viene de una quota silenciosa | field-pattern | ops, platform | [P] |
| 7.7 | [P] Cuándo escalar — qué llevar al equipo de plataforma y qué al equipo de desarrollo | concept-introduction | ops | [P] |
| 7.8 | [P] Practice problem — gestión de un incidente de producción con información parcial | practice-problem | ops | [P] |
| 7.9 | [P] Synthesis — el modelo de respuesta a incidentes en OpenShift | synthesis | ops | [P] |

---

## Sección 8 — GitOps y gestión declarativa

> GitOps sobre OpenShift con ArgoCD.
> La gestión declarativa de aplicaciones como práctica
> de madurez operacional.
>
> Orientada al DevOps Engineer y al Platform Engineer.

| # | Título | Tipo | Perfil principal | Estado |
|---|--------|------|------------------|--------|
| 8.1 | [P] GitOps — el modelo declarativo y por qué simplifica la operación | concept-introduction | devops | [P] |
| 8.2 | [P] ArgoCD sobre OpenShift — instalación, configuración y modelo de acceso | concept-introduction | platform | [P] |
| 8.3 | [P] La primera aplicación con GitOps — de manifest a Application | worked-example | devops | [P] |
| 8.4 | [P] Gestión de múltiples entornos con GitOps | worked-example | devops, platform | [P] |
| 8.5 | [P] GitOps en un entorno con múltiples equipos — acceso, tenancy y conflictos | field-pattern | platform | [P] |

---

## Notas de construcción del índice

### Decisiones de alcance tomadas en Phase 0

El libro cubre desde el primer despliegue hasta la madurez operacional —
no la instalación del clúster ni el desarrollo de la aplicación.
El lector llega con código listo y sin experiencia en OpenShift.

### Gaps conocidos en Phase 0

- Secciones 4-8 son hipótesis — sin elicitación todavía.
  La estructura puede cambiar significativamente en Phase 2.
- El volumen relativo de las secciones de troubleshooting
  vs las de conceptos base está por validar contra
  las necesidades reales del público objetivo.
- Los labs (por definir en Phase 5) pueden modificar
  la estructura de las secciones que los preceden.

### Señales de revisión a vigilar en Phase 2

- Los capítulos de SCC aparecen en múltiples secciones —
  posible colisión de granularidad entre 1.3 y 5.1.
- La Sección 7 (troubleshooting) puede ser redundante
  con el contenido de diagnóstico distribuido en otras secciones.
- Los field-patterns identificados son hipótesis —
  validar que corresponden a patrones reales del autor
  antes de comprometerlos como capítulos.
