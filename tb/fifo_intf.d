import esdl;
import uvm;
import esdl.intf.verilator.verilated;
import esdl.intf.verilator.trace;

class fifo_intf: VlInterface
{
	Port!(Signal!(ubvec!1)) clk;
	Port!(Signal!(ubvec!1)) rst;

	VlPort!(8) s_axis_tdata;
	VlPort!(1) s_axis_tkeep;
	VlPort!(1) s_axis_tvalid;
	VlPort!(1) s_axis_tready;
	VlPort!(1) s_axis_tlast;

	VlPort!(8) m_axis_tdata;
	VlPort!(1) m_axis_tkeep;
	VlPort!(1) m_axis_tvalid;
	VlPort!(1) m_axis_tready;
	VlPort!(1) m_axis_tlast;

	VlPort!(1) pause_req;
	VlPort!(1) pause_ack;

	VlPort!(8) status_depth;
	VlPort!(8) status_depth_commit;
	VlPort!(1) status_overflow;
	VlPort!(1) status_bad_frame;
	VlPort!(1) status_good_frame;

}