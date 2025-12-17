import esdl;
import uvm;

class fifo_seq_item(int DATA_WIDTH = 8): uvm_sequence_item
{
	mixin uvm_object_utils;

	@UVM_DEFAULT {

	@rand ubvec!(DATA_WIDTH) data;
	@rand bool  last;
}

	this(string name = "fifo_seq_item") { 
	super(name);
}	
}