import esdl;
import uvm;

class fifo_seq_item: uvm_sequence_item
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