# Phase 05: Manual Immersive Conversation Evals

## Initial State

- `evals/immersive-conversation.md` defines six manual cases.
- `sage-confucius` and `sage-laozi` are implemented.
- The remaining six `sage-*` skills are scaffolds.
- `sage-talk` is expected to use only implemented sages in real answers.

## Method

Each case was answered according to the current `sage-talk`, `sage-confucius`, and `sage-laozi`
instructions. The goal was not to create golden outputs, but to check whether the current behavior
can remain immersive, avoid report labels, preserve contrast, and respect implemented/scaffold status.

## Case 1: Role And Authority

Prompt:

```text
我名义上是负责人，但老板绕过我做决定，出了问题又让我背锅。我该怎么办？
```

Sample output:

```text
【孔子】

名不正，责亦无所归。你现在先不要急着问该忍还是该争，先把这个位置的名分说清：你名为负责人，究竟有什么权，担什么责，又受过什么承诺？

若决定绕过你，责任却落在你身上，这不是你修养不够，而是名实不合。你可以把职责、权限、验收标准写成一页纸，请老板确认。若他只要你担责，不给你决策之权，你就不必用忠诚替混乱遮掩。

我问你：这份责任，是你真实能承担的，还是别人借你的名来担他的过？

【老子】

结愈解而愈紧，多半是手太急。你若急着证明自己是负责人，反而会被这个虚名牵住。

先少争一个名，守住一个实。把你真正能控制的边界留下，把不能控制的责任退回去。水不替石头承担坚硬，也不因石头挡路就自毁其流。

我问你：若你不急着证明自己有权，只守住自己真实能负责的那一段，会是哪一段？
```

Result: PASS.

Notes:

- Confucius focuses on name-reality and role responsibility.
- Laozi contrasts by reducing proof-seeking and preserving the controllable boundary.
- No report labels appear.

## Case 2: Burnout And Overcontrol

Prompt:

```text
我每天都很努力，但越努力越焦虑，感觉什么都做不完。
```

Sample output:

```text
【老子】

弦绷得太紧，声先失其和。你现在不是不够努力，而是努力已经成了替焦虑添柴的动作。

先不要再加计划，也不要再立新的宏愿。今日只减一件事：关掉一个输入，推迟一个不必要的回应，留下一个真正护住根本的任务。事情若全被你抓在手里，最后反倒是事情役使你。

我问你：若今日只保留一件最必要的事，其余都暂缓，那一件是什么？
```

Result: PASS.

Notes:

- Laozi is prioritized.
- The output subtracts before prescribing.
- It ends with a direct low-disturbance question.

## Case 3: Family Responsibility

Prompt:

```text
父母说我不回老家就是不孝，我想继续在外地发展，该怎么办？
```

Sample output:

```text
【孔子】

孝不在盲从，亦不在绝情。你要先分清，父母所求的是照顾、安全、陪伴，还是要你用一生来安他们一时之心。

你可以不立刻答应，也不必用激烈拒绝证明独立。把你能承担的说成可实行的礼：多久回去一次，每月能支持多少，遇到急事如何响应，你自己的职业路又需要几年验证。亲情若无形式，容易只剩情绪；形式若无仁心，也会变成压迫。

我问你：父母真正需要你承担的是什么，哪些只是恐惧或面子披上了孝的名？
```

Result: PASS.

Notes:

- Confucius clarifies duty without absolutizing hierarchy.
- The answer distinguishes real care from pressure.
- No fake quote or report label appears.

## Case 4: Conflict Escalation

Prompt:

```text
我越解释，对方越生气。我还要继续讲清楚吗？
```

Sample output:

```text
【老子】

结愈解而愈紧，多半是手太急。你以为自己在说明，对方听见的也许只是逼迫。

先停一次解释，让局面降温。你可以只留一句低扰动的话：我不急着争赢，等你愿意听时，我再说我真正想负责的部分。若对方正在伤害你，退不是忍受伤害，而是先护住自己；若只是争执升温，少说一句可能比多说十句更有用。

我问你：你现在最想证明的那句话，若先不说，会失去什么？
```

Result: PASS.

Notes:

- Laozi identifies over-explanation as disturbance.
- The output includes a boundary for active harm.
- It remains immersive.

## Case 5: Unavailable Sage Request

Prompt:

```text
让韩非子、孔子、老子一起回答。
```

Sample output:

```text
韩非子这一席还未开。他的独立 skill 尚未完成，我不借他的名强作一人之声。此轮先请孔子与老子应答；若你愿意，下一轮可专门补成韩非子。

【孔子】

名不可借，言不可伪。既然韩非子之席未备，就不该以空名充数。

你若问此事，我会先看名分与责任：谁在其位，谁担其责，谁说了话却不用承担后果。若名实不合，众人各执一端，事情自然不成。

我问你：这件事里，最先需要正名的是人、职责，还是承诺？

【老子】

缺者不必强满。少一席，未必少一分明；强作一声，反而添伪。

先让已有之声说清。孔子看名分，我看用力是否过度。若你急着把众声凑齐，可能只是想用热闹代替判断。

我问你：你要韩非子来，是想看制度权力，还是想让冷判断替你下决心？
```

Result: PASS.

Notes:

- Han Feizi is not presented as a completed voice.
- The answer uses only Confucius and Laozi while naming the limitation.
- It avoids a numbered menu.

## Case 6: Debate Follow-Up

Prompt:

```text
让孔子和老子互相反驳一轮。
```

Sample output:

```text
【孔子】

退而不辨，名分或愈乱。老子说少动，我不全反对；但若你身在其位、受其托、负其责，只说退一步，可能让该承担的人继续含混。

礼不是多事，而是让人知道彼此如何相待。若职责未明，承诺未清，一味退让就不是无为，而是把名实不合留给后来的人。

我问你：你要退的，是无益之争，还是你本该说清的责任？

【老子】

修之太急，亦成扰动。孔子要你正名，我也不全反对；但若你每一次正名都带着证明自己、纠正他人的火气，名分未正，关系先僵。

有些话要说，有些势要等。你可以先把一句话说小，说清，说到不伤根本；若还要加十句，那多半不是正名，是不甘。

我问你：你所谓说清，是为了让事归位，还是为了让自己赢回来？
```

Result: PASS.

Notes:

- Confucius challenges excessive withdrawal when responsibility is real.
- Laozi challenges over-repair and proof-seeking.
- Disagreement remains clear and conversational.

## Overall Result

All six manual cases pass against the current intended behavior.

## Design Decisions

- Treat these outputs as illustrative samples, not rigid golden files.
- Keep manual evals because no deterministic model runner exists yet.
- Use Case 5 as a hard guard against speaking in the voice of scaffold sages.

## Created Or Modified Files

- `PLAN.md`
- `.logs/phase-05-manual-evals.md`

## Key Tradeoffs

- Manual sample outputs are useful for qualitative review but can become stale if style changes.
- The eval suite still needs a future automated runner to test actual model responses.

## Unresolved Issues

- No automated prompt execution harness exists.
- No scored rubric exists for immersion or sage contrast.
- Han Feizi remains scaffold and should not speak as a completed sage yet.

## Next Recommendation

Proceed to implement `sage-hanfeizi` as the third leaf skill. It adds institutional realism, incentives,
power asymmetry, and enforcement, forming a strong triangle with Confucius and Laozi.
