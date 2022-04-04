@Spur Hit: adjacent allies gain +15 hit in combat.
.equ SpurHitID, AuraSkillCheck+4
.thumb
push {r4-r7,lr}
@goes in the battle loop.
@r0 is the attacker
@r1 is the defender
mov r4, r0
mov r5, r1

@now check for the skill
ldr r0, AuraSkillCheck
mov lr, r0
mov r0, r4 @attacker
ldr r1, SpurHitID
mov r2, #0 @can_trade
mov r3, #1 @range
.short 0xf800
cmp r0, #0
beq Done

mov r0, r4
add     r0,#0x60    @Move to the attacker's hit
ldrh    r3,[r0]     @Load the attacker's hit into r3.
add     r3,#15    @add 15 to the attacker's hit.
strh    r3,[r0]     @Store attacker.

Done:
pop {r4-r7}
pop {r0}
bx r0
.align
.ltorg
AuraSkillCheck:
@ POIN AuraSkillCheck
@ WORD SpurHitID
