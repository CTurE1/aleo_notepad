program notepad.aleo;

struct Message:
    content as field;


mapping MessageMap:
	key left as u32.public;
	value right as Message.public;


mapping UserMessageCount:
	key left as address.public;
	value right as u32.public;

function add_message:
    input r0 as field.public;
    cast r0 into r1 as Message;
    output r1 as Message.private;

    finalize self.caller r1;

finalize add_message:
    input r0 as address.public;
    input r1 as Message.public;
    get UserMessageCount[r0] into r2;
    set r1 into MessageMap[r2];
    set r1 into MessageMap[r2];
    add r2 1u32 into r3;
    set r3 into UserMessageCount[r0];


function remove_message:
    input r0 as u32.public;
    output r0 as u32.private;

    finalize self.caller r0;

finalize remove_message:
    input r0 as address.public;
    input r1 as u32.public;
    get UserMessageCount[r0] into r2;
    lt r1 r2 into r3;
    remove MessageMap[r1];
    sub r2 1u32 into r4;
    set r4 into UserMessageCount[r0];


function clear_messages:

    finalize self.caller;

finalize clear_messages:
    input r0 as address.public;
    get UserMessageCount[r0] into r1;
    contains MessageMap[0u32] into r2;
    remove MessageMap[0u32];
    contains MessageMap[1u32] into r3;
    remove MessageMap[1u32];
    contains MessageMap[2u32] into r4;
    remove MessageMap[2u32];
    contains MessageMap[3u32] into r5;
    remove MessageMap[3u32];
    contains MessageMap[4u32] into r6;
    remove MessageMap[4u32];
    contains MessageMap[5u32] into r7;
    remove MessageMap[5u32];
    contains MessageMap[6u32] into r8;
    remove MessageMap[6u32];
    contains MessageMap[7u32] into r9;
    remove MessageMap[7u32];
    contains MessageMap[8u32] into r10;
    remove MessageMap[8u32];
    contains MessageMap[9u32] into r11;
    remove MessageMap[9u32];
    contains MessageMap[10u32] into r12;
    remove MessageMap[10u32];
    contains MessageMap[11u32] into r13;
    remove MessageMap[11u32];
    contains MessageMap[12u32] into r14;
    remove MessageMap[12u32];
    contains MessageMap[13u32] into r15;
    remove MessageMap[13u32];
    contains MessageMap[14u32] into r16;
    remove MessageMap[14u32];
    set 0u32 into UserMessageCount[r0];
