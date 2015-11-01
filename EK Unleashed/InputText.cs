﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace EKUnleashed
{
    public partial class frmInputText : Form
    {
        public frmInputText()
        {
            InitializeComponent();

        }

        private void frmInputText_Shown(object sender, EventArgs e)
        {
            this.txtInput.Focus();
        }

        public string Title
        {
            get
            {
                return this.Text.Trim();
            }
            set
            {
                this.Text = value.Trim();
            }
        }

        public string Input
        {
            get
            {
                return this.txtInput.Text.Trim();
            }
            set
            {
                this.txtInput.Text = value.Trim();
            }
        }

        public string Instructions
        {
            get
            {
                return this.lblInstructions.Text.Trim();
            }
            set
            {
                this.lblInstructions.Text = value.Trim();
            }
        }
    }
}
