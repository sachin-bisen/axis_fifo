import esdl;
import uvm;
import fifo_seq_item: fifo_seq_item;

alias fifo_item_t = fifo_seq_item!8;

class fifo_sequence: uvm_sequence!fifo_item_t
{
	//mixin uvm_object_utils;

	this(string name = "fifo_sequence") {
	super(name);
}



override void body()
{
fifo_item_t item;

item = fifo_item_t.type_id.create("item_0");
item.data = 10;
item.last = false;
start_item(item);
finish_item(item);

item = fifo_item_t.type_id.create("item_1");
item.data = 20;
item.last = false;
start_item(item);
finish_item(item);

item = fifo_item_t.type_id.create("item_2");
item.data = 30;
item.last = true;
start_item(item);
finish_item(item);

}
}