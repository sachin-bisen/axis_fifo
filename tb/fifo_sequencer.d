import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;

alias fifo_item_t = fifo_seq_item!8;
class fifo_sequencer: uvm_sequencer!fifo_item_t
{
	mixin uvm_component_utils;

	this(string name, uvm_component parent = null) {
	super(name, parent);
}
}