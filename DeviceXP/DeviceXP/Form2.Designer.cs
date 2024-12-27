namespace DeviceXP
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DrugName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MustStockCount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.RealStockCount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Batch = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ValidTime = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.BindID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DoorIndex = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.SuspendLayout();
            // 
            // Column1
            // 
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Column1.DefaultCellStyle = dataGridViewCellStyle1;
            this.Column1.FillWeight = 7F;
            this.Column1.HeaderText = "位置";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // DrugName
            // 
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.TopLeft;
            this.DrugName.DefaultCellStyle = dataGridViewCellStyle2;
            this.DrugName.FillWeight = 23F;
            this.DrugName.HeaderText = "药名";
            this.DrugName.Name = "DrugName";
            this.DrugName.ReadOnly = true;
            this.DrugName.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.DrugName.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // Column3
            // 
            this.Column3.FillWeight = 10F;
            this.Column3.HeaderText = "规格";
            this.Column3.Name = "Column3";
            this.Column3.ReadOnly = true;
            this.Column3.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column3.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // Column4
            // 
            this.Column4.FillWeight = 10F;
            this.Column4.HeaderText = "厂家";
            this.Column4.Name = "Column4";
            this.Column4.ReadOnly = true;
            this.Column4.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // Column5
            // 
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Column5.DefaultCellStyle = dataGridViewCellStyle3;
            this.Column5.FillWeight = 7F;
            this.Column5.HeaderText = "基数";
            this.Column5.Name = "Column5";
            this.Column5.ReadOnly = true;
            this.Column5.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column5.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // Column6
            // 
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            this.Column6.DefaultCellStyle = dataGridViewCellStyle4;
            this.Column6.FillWeight = 7F;
            this.Column6.HeaderText = "库存";
            this.Column6.Name = "Column6";
            this.Column6.ReadOnly = true;
            this.Column6.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Column6.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // MustStockCount
            // 
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.MustStockCount.DefaultCellStyle = dataGridViewCellStyle5;
            this.MustStockCount.FillWeight = 7F;
            this.MustStockCount.HeaderText = "应补";
            this.MustStockCount.Name = "MustStockCount";
            this.MustStockCount.ReadOnly = true;
            this.MustStockCount.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.MustStockCount.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // RealStockCount
            // 
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle6.ForeColor = System.Drawing.Color.Red;
            this.RealStockCount.DefaultCellStyle = dataGridViewCellStyle6;
            this.RealStockCount.FillWeight = 10F;
            this.RealStockCount.HeaderText = "实补";
            this.RealStockCount.Name = "RealStockCount";
            this.RealStockCount.ReadOnly = true;
            this.RealStockCount.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.RealStockCount.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // Batch
            // 
            this.Batch.FillWeight = 10F;
            this.Batch.HeaderText = "批号";
            this.Batch.Name = "Batch";
            this.Batch.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.Batch.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // ValidTime
            // 
            this.ValidTime.FillWeight = 10F;
            this.ValidTime.HeaderText = "效期";
            this.ValidTime.Name = "ValidTime";
            this.ValidTime.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.ValidTime.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // BindID
            // 
            this.BindID.HeaderText = "BindID";
            this.BindID.Name = "BindID";
            this.BindID.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.BindID.Visible = false;
            // 
            // DoorIndex
            // 
            this.DoorIndex.HeaderText = "DoorIndex";
            this.DoorIndex.Name = "DoorIndex";
            this.DoorIndex.Visible = false;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(672, 536);
            this.Name = "Form2";
            this.Text = "Form2";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn DrugName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.DataGridViewTextBoxColumn MustStockCount;
        private System.Windows.Forms.DataGridViewTextBoxColumn RealStockCount;
        private System.Windows.Forms.DataGridViewTextBoxColumn Batch;
        private System.Windows.Forms.DataGridViewTextBoxColumn ValidTime;
        private System.Windows.Forms.DataGridViewTextBoxColumn BindID;
        private System.Windows.Forms.DataGridViewTextBoxColumn DoorIndex;
    }
}