import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;
import fifo_sequence: fifo_sequence;
import fifo_intf: fifo_intf;

alias fifo_seq_item_t = fifo_seq_item!8;

class fifo_monitor: uvm_monitor
{
	mixin uvm_component_utils;
	fifo_intf fifo_in;

	this(string name, uvm_component parent = null) {
	super(name, parent);

}
	 @UVM_BUILD uvm_analysis_port!(fifo_seq_item_t) egress;
     
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
if(fifo_in.rst == 1 || fifo_in.s_axis_tready == 0 || fifo_in.s_axis_tvalid == 0) continue;
	else {
	 fifo_seq_item_t item = fifo_seq_item_t.type_id.create(get_full_name() ~ ".fifo_seq_item_t");

	 item.data = fifo_in.s_axis_tdata;
	 item.last = fifo_in.s_axis_tlast;
	 
         uvm_info("FIFO: ITEM", format("\n%s", item.sprint()),
                 UVM_DEBUG);
        egress.write(item);
 

}
	
	





}

}
}