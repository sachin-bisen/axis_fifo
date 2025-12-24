import esdl;
import uvm;

import fifo_monitor: fifo_monitor;
import fifo_sequencer: fifo_sequencer;
import fifo_driver: fifo_driver;


class fifo_agent: uvm_agent
{
	@UVM_BUILD {
	fifo_sequencer sequencer;
	fifo_driver  driver;

	fifo_monitor in_monitor;
	fifo_monitor out_monitor;

}

	//mixin uvm_component_utils;

	this(string name, uvm_component parent = null) {
	super(name, parent);

}

	override void connect_phase(uvm_phase phase) {
	  driver.seq_item_port.connect(sequencer.seq_item_export);
	  super.connect_phase(phase);


}

}