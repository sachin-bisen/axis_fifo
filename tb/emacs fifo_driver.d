import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;
import fifo_intf: fifo_intf;

alias fifo_item_t = fifo_seq_item!8;

class fifo_driver: uvm_driver!fifo_item_t
{
	mixin uvm_component_utils;

	fifo_intf 


}