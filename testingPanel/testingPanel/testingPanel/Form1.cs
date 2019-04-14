using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testingPanel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void AutoSizeTextBox(TextBox txt)
        {
            const int x_margin = 0;
            const int y_margin = 2;
            Size size = TextRenderer.MeasureText(txt.Text, txt.Font);
            txt.ClientSize =
                new Size(size.Width + x_margin, size.Height + y_margin);

        }
        
        private void Form1_Load(object sender, EventArgs e)
        {
            List<testing> testings = new List<testing>()
            {
                new testing() { TTest = "textxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtxtextxtxttxtx" },
                new testing() { TTest = "looreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreemlooreem" },
                new testing() { TTest = "lalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjnlalalrihiruehugjn" }
            };
            //int txtname = 0;
            //foreach (var v in testings)
            //{
            //    TextBox txt = new TextBox();
            //    txt.Name = "txtval"+txtname;

            //    txt.Text = v.TTest;

            //    flowLayoutPanel1.Controls.Add(txt);

            //    // Register the TextChanged event handler.
            //    txt.TextChanged += txtChanged_TextChanged;
            //    txt.Multiline = true;
            //    txt.ScrollBars = ScrollBars.None;

            //    // Make the TextBox fit its initial text.
            //    AutoSizeTextBox(txt);
            //    txt.MaximumSize = new Size(320, int.MaxValue);
            //    txt.TextChanged += new EventHandler(txtChanged_TextChanged);
            //}
            ///
            /// 
            /// 
            //// Register the TextChanged event handler.
            //textBox1.TextChanged += textBox1_TextChanged;
            //textBox1.Multiline = true;
            //textBox1.ScrollBars = ScrollBars.None;

            //// Make the TextBox fit its initial text.
            //AutoSizeTextBox(textBox1);
            
            foreach (var v in testings)
            {
                UserControl1 us = new UserControl1();
                
                ml.Parent = us.panel1;
                ml.AutoSize = true;
                ml.MultiLine = true;
                us.label1.Text = "tutle";
                us.label2.Text = "des";

                ml.Text = v.TTest;
                int o = ml.Height;

                us.panel1.Size = new Size(300, o);

                ml = new MultiLineLabel();
                flowLayoutPanel1.Controls.Add(us);
            }
        }

        private void txtChanged_TextChanged(object sender, EventArgs e)
        {
            AutoSizeTextBox(sender as TextBox);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            AutoSizeTextBox(sender as TextBox);
        }


        MultiLineLabel ml = new MultiLineLabel();
        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            const String s = "Veeeerrrryyyyy Loooggg uggUYUIYRUYUIOIOII opoPUUUUPPRUURI Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt Veeeerrrryyyyy Loooooonnnngggggg TTTeeeeeeexxxxxxxtttttt";
            

            UserControl1 us = new UserControl1();

            ml.Parent = us.panel1;
            ml.AutoSize = true;
            ml.MultiLine = true;
            us.label1.Text = "tutle";
            us.label2.Text = "des";

            ml.Text = s;
            int o = ml.Height;

            us.panel1.Size = new Size(300, o);
            us.Height = o+12;
            ml = new MultiLineLabel();
            flowLayoutPanel1.Controls.Add(us);

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
