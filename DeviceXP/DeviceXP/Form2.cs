using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows.Forms;

namespace DeviceXP
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            

        }
        private void Form2_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < 100; i++)
            {
                //dataGridView1.Rows.Add();
            }
        }

        private void Panel1_MouseWheel(object sender, MouseEventArgs e)
        {
            
        }
        [DllImport("user32.dll")]
        static extern void mouse_event(int flags, int dX, int dY, int buttons, int extraInfo);
        const int MOUSEEVENTF_WHEEL = 0x800;
    }
}
