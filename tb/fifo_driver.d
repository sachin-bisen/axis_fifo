import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;
import fifo_sequence: fifo_sequence;
import fifo_intf: fifo_intf;

alias fifo_item_t = fifo_seq_item!8;

class fifo_driver: uvm_driver!fifo_item_t
{
	mixin uvm_component_utils;

	fifo_intf fifo_in;

  this(string name, uvm_component parent = null) {
    super(name, parent);
  }

  override void connect_phase(uvm_phase phase) {
    super.connect_phase(phase);

    uvm_config_db!fifo_intf.get(this, "", "fifo_in", fifo_in);
    assert (fifo_in !is null);
  }
    
  override void run_phase(uvm_phase phase) {
    super.run_phase(phase);
    fifo_item_t item;
    while(true) {
    seq_item_port.get_next_item(item);

    if (item !is null) {
    while(fifo_in.s_axis_tready == 0 || fifo_in.rst == 1) {
    wait (fifo_in.clk.negedge());

    fifo_in.s_axis_tlast = false;
    fifo_in.s_axis_tvalid = false;
    

}

	wait (fifo_in.clk.negedge());
	fifo_in.s_axis_tdata = item.data;
	fifo_in.s_axis_tlast = item.last;
	fifo_in.s_axis_tvalid = true;

	seq_item_port.item_done();
  	}
	else {
	wait (fifo_in.clk.negedge());

	fifo_in.s_axis_tlast = false;
        fifo_in.s_axis_tvalid = false;
  


}
}
}
}