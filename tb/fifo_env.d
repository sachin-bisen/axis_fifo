import esdl;
import uvm;

import fifo_agent: fifo_agent;
import fifo_monitor: fifo_monitor;
import fifo_scoreboard: fifo_scoreboard;

class fifo_env: uvm_env
{
	mixin uvm_component_utils;

	@UVM_BUILD fifo_agent agent;
	@UVM_BUILD fifo_scoreboard scoreboard;

	this(string name, uvm_component parent) {
	super(name, parent);

}


	override void connect_phase(uvm_phase phase) {
	super.connect_phase(phase);
	
	agent.in_monitor.egress.connect(scoreboard.req_analysis);
	agent.out_monitor.egress.connect(scoreboard.rsp_analysis);
	 

}

}