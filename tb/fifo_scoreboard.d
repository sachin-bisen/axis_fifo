import esdl;
import uvm;

import fifo_seq_item: fifo_seq_item;
import std.format: format;

alias fifo_item_t = fifo_seq_item!8;

class fifo_scoreboard: uvm_scoreboard
{
	mixin uvm_component_utils;

	this(string name, uvm_component parent = null) {
	super(name, parent);

}

	//phase handle for objection
	uvm_phase phase_run;

	//Starting Golden Model(Fifo Queue)


	fifo_item_t[] model_q;

     @UVM_BUILD {
     uvm_analysis_imp!(fifo_scoreboard, write_req) req_analysis;
     uvm_analysis_imp!(fifo_scoreboard, write_rsp) rsp_analysis;
     
}
	//Now writing Run Phase for Idle Scoreboard

	override void run_phase(uvm_phase phase) {
	phase_run = phase;
	uvm_wait_for_ever();

}
    void write_req(fifo_item_t item)
    {
      uvm_info("FIFO_SB",
            format("REQ data=%0d last=%0b", item.data, item.last),
	    UVM_DEBUG);

	    model_q ~= item;  //

	    assert(phase_run !is null);
	    phase_run.raise_objection(this);

}

	void write_rsp(fifo_item_t item)
{
	uvm_info("FIFO_SB",
      format("RSP  data=%0d last=%0b", item.data, item.last), UVM_DEBUG);

      if(model_q.length == 0) {
      uvm_fatal("FIFO_SB", "Output received but golden Fifo is empty");
}

	auto exp = model_q[0];
	model_q = model_q[1 .. $];    //dequeue

	if(exp.data == item.data && exp.last == item.last) {
	uvm_info("FIFO_MATCH",
       format("MATCH data=%0d last=%0b", item.data, item.last), UVM_LOW);
}

else {
 uvm_error("FIFO_MISMATCH",
    format("EXP(data=%0d,last=%0b) ACT(data=%0d,last=%0b)",
            exp.data, exp.last,
	    item.data, item.last));
}

	assert(phase_run !is null);
		 phase_run.drop_objection(this);

}
}
