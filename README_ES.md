# SageTalk.skill

> Usa a Confucio, Laozi, Han Feizi, Wang Yangming y otros pensadores chinos antiguos como repo skills
> invocables para problemas modernos.

Other Languages:
[中文](README.md) · [English](README_EN.md) · [日本語](README_JA.md) · [한국어](README_KO.md)

SageTalk es un monorepo de múltiples skills para conversaciones inmersivas y de múltiples
perspectivas con pensadores chinos antiguos.

No es un generador de citas ni un simple juego de rol. Divide un sistema de consejo de sabios en
skills que un agente puede descubrir e invocar:

- `sage-talk`: enrutamiento, consejo multi-sabio, comparación, debate y seguimiento.
- `sage-*`: una skill independiente por sabio, con sus propias fuentes, visión del mundo, modelos de
  juicio, reglas de voz y ejemplos.

## Ejemplos

Usuario:

```text
Soy responsable de un proyecto, pero no tengo autoridad de decisión. Cuando algo sale mal, me culpan.
¿Qué debo hacer?
```

Salida posible:

```text
【韩非子】

权不在其手，责却归其身，此为受制之局。

El peligro inmediato no es solo hacer mal el trabajo. Es estar en un puesto donde el título y la
autoridad no coinciden. Primero deja claro quién decide, quién ejecuta, cuáles son los riesgos y dónde
queda el registro de confirmación.

Te pregunto: ¿quién te está haciendo cargar con la culpa, tu jefe directo, alguien del mismo nivel o
otro departamento?
```

## Instalación

### Instalación en un comando para las skills globales de Codex

```bash
curl -fsSL https://raw.githubusercontent.com/zijian-ai-projects/SageTalk/main/scripts/install-codex-skills.sh | sh
```

Reinicia Codex después de instalar. Este comando instala `sage-talk` y todas las leaf skills `sage-*`
como un paquete.

### Opción 2: clonar e instalar localmente

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
scripts/install-codex-skills.sh
```

Opciones:

```bash
scripts/install-codex-skills.sh --force
scripts/install-codex-skills.sh --dest /path/to/skills
scripts/install-codex-skills.sh --dry-run
```

### Opción 3: usar SageTalk como repositorio Codex repo skill

```bash
git clone git@github.com:zijian-ai-projects/SageTalk.git
cd SageTalk
```

Abre este repositorio en Codex. Codex descubre las repo skills desde `.agents/skills/`.

### Opción 4: copiar a tu propio repositorio

```bash
mkdir -p /path/to/your-repo/.agents
cp -R .agents/skills /path/to/your-repo/.agents/
```

Abre tu repositorio objetivo en Codex. `sage-talk` y las skills `sage-*` serán descubiertas como repo
skills de ese proyecto.

## Soporte de plataformas

El contenido de SageTalk no está limitado a Codex, pero el proyecto es actualmente Codex-first:

- Codex repo skills: la ruta principal, con descubrimiento desde `.agents/skills/`.
- Codex global skills: copia a `$CODEX_HOME/skills/`.
- Otros agentes con mecanismo estilo `SKILL.md`: portable si ajustas la ruta de instalación.
- ChatGPT normal o plataformas sin descubrimiento de skills: solo uso manual como contexto; proporciona
  el `SKILL.md` y las referencias necesarias.

## Qué Extrae SageTalk

| Capa | Significado |
| --- | --- |
| Visión del mundo | Qué ve primero cada sabio y qué tiende a ignorar. |
| Modelo de juicio | Cómo trasladar principios antiguos a razonamiento moderno y accionable. |
| Expresión | Una apertura breve con color de personaje y una explicación moderna clara. |
| Antipatrones | Sin collage de citas, falso estilo clásico, productividad mística ni frases inventadas. |
| Límites | Los pensadores antiguos no conocen hechos modernos; los dominios profesionales requieren expertos. |

## Sabios Implementados

- `sage-confucius`: Confucio
- `sage-mencius`: Mencio
- `sage-laozi`: Laozi
- `sage-zhuangzi`: Zhuangzi
- `sage-mozi`: Mozi
- `sage-hanfeizi`: Han Feizi
- `sage-sunzi`: Sunzi
- `sage-wang-yangming`: Wang Yangming

## Uso

```text
Pregunta a Han Feizi: soy responsable sin autoridad. ¿Cómo me protejo?
```

```text
Deja que Confucio, Laozi y Han Feizi respondan: mi rol y mi autoridad no están claros.
```

```text
Compara a Mencio y Mozi: ¿debería aceptar un trabajo bien pagado en una empresa que engaña a usuarios?
```

## Cómo Funciona

```text
Problema del usuario
  ↓
sage-talk clasifica el modo
  ↓
elige skills sage-* implementadas desde un registry ligero
  ↓
cada sage-* responde con sus fuentes, modelos y reglas de voz
  ↓
sage-talk conserva las diferencias y continúa el seguimiento
```

`sage-talk` no almacena perfiles completos. Worldview, mental models, source notes y voice rules
pertenecen a cada skill `sage-*`.

## Verificación

```bash
sh evals/check-static.sh
```
