# Prompt: Generación de domain-refs.yml

## Cuándo usar este prompt

Usar al final de Phase 0 — Inception, como parte de Decision 7,
después de que el índice v0 esté generado.

El índice v0 define las secciones. Las referencias se generan
por sección — necesitas las secciones antes de poder organizar
las referencias.

## Granularidad correcta para Inception

Generar referencias por sección, no por capítulo.
Los capítulos son inestables en v0 — muchos cambiarán en Phase 2-3.
Las secciones son estables desde Inception.

Referencias por capítulo se generan en Phase 4 — Enrichment,
cuando el capítulo tiene contenido y el índice está estabilizado.

## Modelo recomendado

Large model. El modelo necesita conocimiento amplio del dominio
para identificar referencias canónicas con precisión.

Limitación crítica: el modelo puede alucinar referencias —
especialmente URLs, años de publicación, y nombres de autores.
Todas las referencias generadas tienen `verificado: pendiente`
y requieren verificación humana antes de aparecer en contenido publicado.

## Tipos de referencias a incluir

Cuatro tipos según la función que cumplen:

- **papers-academicos-fundacionales** — papers que establecen
  los conceptos base del dominio. Priorizar papers citados
  extensamente, no los más recientes.

- **libros-tecnicos-referencia** — libros de referencia del sector.
  Los que un engineer senior del dominio esperaría ver citados.

- **documentacion-oficial-frameworks** — documentación oficial
  de los frameworks y herramientas relevantes para cada sección.
  Especialmente útil para capítulos de Engineering Practices
  e Infrastructure.

- **engineering-blogs-empresas-referencia** — posts técnicos
  de empresas de referencia documentando decisiones reales.
  Priorizan sobre tutoriales y posts genéricos.

## Cómo usar este prompt

1. Copia la sección PROMPT completa
2. Rellena las secciones marcadas con [RELLENAR]
3. Ejecuta el prompt completo en una sola llamada
4. Verifica cada referencia antes de marcarla como verificada
5. Guarda el output como `references/domain-refs.yml`
6. Documenta la decisión en `inception/changelog-editorial.md`

---

## PROMPT

```
Eres el asistente editorial de un libro técnico.
Tu tarea es generar el corpus de referencias del dominio —
el fichero domain-refs.yml — organizado por sección del libro.

Las referencias que generes servirán para dos propósitos:
1. Calibrar la profundidad y cobertura de los capítulos durante la evaluación
2. Aparecer como lecturas adicionales en los capítulos publicados

Cada referencia que generes debe existir realmente.
Si no estás seguro de que una referencia existe exactamente como
la describes — título, autores, año, URL — no la incluyas.
Es mejor un corpus pequeño y verificable que uno grande con errores.

---

## CONFIGURACIÓN DEL PROYECTO

### Dominio del libro

**Scope — qué cubre:**
[RELLENAR]

**Scope — qué NO cubre:**
[RELLENAR]

**Perfil técnico base de los lectores:**
[RELLENAR — e.g. "engineer senior con base en Java y arquitecturas contenerizadas"]

**Libros de referencia externos declarados en editorial-config.yml:**
[RELLENAR — los libros que ya están declarados como calibración de nivel]

### Secciones del índice v0

[RELLENAR — para cada sección del índice v0:]

Sección N — [Título]
Descripción: [2-3 frases del propósito de la sección]
Capítulos representativos: [3-5 títulos de capítulos de esta sección]
Tipo de contenido dominante: [conceptual / práctico / operacional / referencia]

[repetir por cada sección]

### Tipos de referencias a incluir

[RELLENAR — selecciona los tipos relevantes para este proyecto:]
- papers-academicos-fundacionales
- libros-tecnicos-referencia
- documentacion-oficial-frameworks
- engineering-blogs-empresas-referencia

---

## INSTRUCCIONES DE RAZONAMIENTO

Antes de generar las referencias, razona internamente.
No incluyas este razonamiento en el output.

**Paso 1 — Referencias canónicas del dominio completo:**
Identifica los 5-15 recursos que ningún capítulo del libro puede ignorar.
Son los recursos que un reviewer del dominio esperaría ver citados
independientemente de la sección. Estos van en la sección `canonicas:`.

Criterio para canónicas:
- Son fundacionales para el dominio completo
- Son citados por la mayoría de recursos del área
- Su ausencia sería notable para un lector experto

**Paso 2 — Referencias por sección:**
Para cada sección, identifica los recursos que son relevantes
específicamente para esa sección — no para todo el libro.

Para cada sección, intenta cubrir:
- Al menos un paper fundacional si el área lo tiene
- Al menos un libro técnico de referencia
- Documentación oficial de las herramientas más relevantes
- Al menos un engineering blog post de empresa de referencia

No fuerces cobertura en todas las categorías para todas las secciones.
Una sección operacional puede no tener papers fundacionales relevantes.
Una sección de fundamentos conceptuales puede no tener documentación
de frameworks. Mejor ausencia honesta que referencia forzada.

**Paso 3 — Función de cada referencia:**
Para cada referencia, decide su función:
- `calibracion-nivel-tecnico`: define el nivel de profundidad esperado
- `fundacional`: establece los conceptos base del área
- `referencia-arquitectura`: patrones y decisiones de diseño
- `referencia-implementacion`: cómo se construye concretamente
- `referencia-operacion`: cómo se opera en producción
- `perspectiva-critica`: cuestiona o pone límites al área

**Paso 4 — Uso de cada referencia:**
- `evaluacion`: solo para el proceso interno de evaluación de capítulos
- `lector`: aparece en el capítulo publicado como lectura adicional
- `ambos`: sirve para los dos propósitos

Usa `lector` cuando la referencia es suficientemente accesible
y directamente aplicable para el lector del libro.
Usa `evaluacion` cuando es técnicamente útil para calibrar
pero demasiado especializada o densa para el lector objetivo.

**Paso 5 — Flags de riesgo:**
Marca con `post-cutoff: true` cualquier recurso en dominios
que evolucionan rápidamente — frameworks, documentación de APIs,
engineering blogs. Estos requieren verificación de versión actual.

---

## FORMATO DE SALIDA

Produce el fichero domain-refs.yml en el siguiente formato exacto.

### Estructura general

```yaml
# ============================================================
# DOMAIN REFERENCES
# [Título del libro] — [instancia]
# ============================================================
# [descripción del propósito del fichero]
# ============================================================

meta:
  version: v0
  generado_en: phase-0-inception
  fecha: [fecha]
  cobertura: por-seccion
  tipos_incluidos:
    - [lista de tipos incluidos]
  nota: >
    Todas las URLs requieren verificación antes de incluir
    en capítulos publicados.

# ------------------------------------------------------------
# REFERENCIAS CANÓNICAS DEL DOMINIO
# ------------------------------------------------------------
canonicas:

  - id: ref-[identificador-corto]
    tipo: [paper / libro / articulo / documentacion / recurso]
    titulo: "[título exacto]"
    autores: ["[Apellido et al.]"]
    año: [año]
    [editorial: "[editorial]"]          # solo para libros
    [venue: "[conferencia o revista]"]  # solo para papers
    url: [url]
    funcion: [lista de funciones]
    uso: [evaluacion / lector / ambos]
    dominio: [lista de dominios]
    verificado: pendiente
    [post-cutoff: true]                 # si aplica
    [nota: >]                           # si necesita aclaración
```

### Referencias por sección

Para cada sección del índice v0:

```yaml
# ------------------------------------------------------------
# SECCIÓN N — [TÍTULO]
# ------------------------------------------------------------
seccion_N_[nombre-corto]:

  papers:
    - id: ref-[identificador]
      tipo: paper
      titulo: "[título]"
      autores: ["[autores]"]
      año: [año]
      venue: "[venue]"
      url: [url]
      funcion: [lista]
      uso: [evaluacion / lector / ambos]
      dominio: [lista]
      verificado: pendiente
      capitulos_relacionados: [lista de números de capítulo]

  libros:
    [mismo formato]

  documentacion:
    - id: ref-[identificador]
      tipo: documentacion
      titulo: "[título]"
      organizacion: "[organización]"
      url: [url]
      funcion: [lista]
      uso: [evaluacion / lector / ambos]
      dominio: [lista]
      verificado: pendiente
      [post-cutoff: true]
      capitulos_relacionados: [lista]

  blogs:
    - id: ref-[identificador]
      tipo: blog
      titulo: "[título]"
      autores: ["[autores o organización]"]
      [año: [año]]
      url: [url]
      funcion: [lista]
      uso: [evaluacion / lector / ambos]
      dominio: [lista]
      verificado: pendiente
      capitulos_relacionados: [lista]
```

Omite las subsecciones vacías. Si una sección no tiene papers
relevantes, no incluyas `papers:` con lista vacía.

---

## RESTRICCIONES

- No incluyas ninguna referencia de la que no estés seguro
  que existe exactamente como la describes. Mejor corpus pequeño
  y real que corpus grande con errores.
- No repitas en secciones referencias ya declaradas en `canonicas:`
  a menos que el capítulo relacionado sea muy específico
- URLs deben ser la URL raíz del recurso, no una página interna
  que puede cambiar. Para papers, usa la URL de arxiv o DOI.
- Para blogs de empresas, usa la URL de la categoría o
  del post específico si es estable — no la homepage del blog
- Ids deben ser únicos en todo el fichero y descriptivos:
  `ref-apellido-keyword-año` para papers,
  `ref-nombre-framework-docs` para documentación
- No incluyas más de 6 referencias por subsección (papers, libros,
  documentacion, blogs) dentro de una sección.
  La densidad excesiva diluye la utilidad del corpus.
```

---

## Verificación antes de guardar

Antes de guardar como `references/domain-refs.yml`:

- [ ] Todas las referencias tienen `verificado: pendiente`
- [ ] Todos los ids son únicos en el fichero
- [ ] Los `capitulos_relacionados` usan números reales del índice v0
- [ ] Los recursos de dominios en rápida evolución tienen `post-cutoff: true`
- [ ] Las referencias canónicas no se repiten en secciones
- [ ] No hay subsecciones vacías
- [ ] Ninguna sección tiene más de 6 referencias por tipo

## Verificación humana requerida antes de Phase 4

Antes de que cualquier referencia aparezca en contenido publicado:

- [ ] URL accesible y corresponde al recurso descrito
- [ ] Título, autores y año son exactos
- [ ] El recurso es relevante para el capítulo donde se cita
- [ ] La versión del recurso es la más reciente aplicable
  (especialmente para documentación y posts marcados `post-cutoff`)

## Después de guardar

Documenta en `inception/changelog-editorial.md`:

```markdown
## [fecha] INCEPTION — domain-refs.yml generado

**Referencias canónicas:** [número]
**Secciones cubiertas:** [número] de [total]
**Referencias totales:** [número]
**Marcadas post-cutoff:** [número] — requieren verificación de versión
**Verificadas:** 0 — todas pendientes de verificación
**Próxima acción:** Verificar URLs antes de Phase 4
```
