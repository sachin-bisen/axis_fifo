import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;
import fifo_sequence: fifo_sequence;
import fifo_intf: fifo_intf;

class fifo_monitor: uvm_monitor
{
	mixin uvm_component_utils;
	fifo_intf fifo_in;

	this(string name, uvm_component parent = null) {
	super(name, parent);

}
	 @UVM_BUILD uvm_analysis_port!(fifo_seq_item) egress;
     
        override void connect_phase(uvm_phase phase) {
               super.connect_phase(phase);

        uvm_config_db!fifo_intf.get(this, "", "fifo_in", fifo_in);
	assert(fifo_in !is null);
}

	override void run_phase(uvm_phase phase) {
		 import std.format: format;

		 super.run_phase(phase);
		 while(true) {
		 wait (fifo_in.clk.posedge());
		      if(fifo_in.rst == 1 ||
	fifo_in.s_axis_tready == 0 || fifo_in.s_axis_tvalid = 0);
	continue;
	else {
	 fifo_seq_item item = fifo_seq_item.type_id.create(get_full_name() ~ ".fifo_seq_item");
	 
}
	
	


}


}

}
