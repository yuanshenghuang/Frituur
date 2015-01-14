/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CategoryAdmin;

import BO.Category;
import BO.Product;
import ProductAdmin.JFrameProduct;
import Services.CategoryService;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author huang
 */
public class CategoryVerandering extends javax.swing.JPanel {

    /**
     * Creates new form CategoryVerandering
     */
    public CategoryVerandering() {
        initComponents();
        
               
       final int option = JOptionPane.showConfirmDialog(null, this, "", JOptionPane.OK_CANCEL_OPTION);    
        if (!txtNaam.getText().equals(""))
        {
            if (option == JOptionPane.OK_OPTION)
            {
                _category = new Category();

                _category.setName(txtNaam.getText());

            }
            else if (option == JOptionPane.CANCEL_OPTION)
            {
                JFrameCategory jframecategory = new JFrameCategory();
            }
        }
        else
        {
            JOptionPane.showMessageDialog(this, "add category failed");
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtNaam = new javax.swing.JTextField();

        jLabel1.setText("naam");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(txtNaam, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(46, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(44, 44, 44)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtNaam, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(70, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private Category _category = null;
    
    public Category getCategory()
    {
        return _category;
    }

    public void setCategory(Category category)
    {
        this._category = category;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField txtNaam;
    // End of variables declaration//GEN-END:variables
}
