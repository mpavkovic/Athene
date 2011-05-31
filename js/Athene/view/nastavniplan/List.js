Ext.define('Athene.view.nastavniplan.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavniplanlist',
    id: 'nastavniplanlist',
    
    title: 'Popis nastavnih planova',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'nastavniplangrid',
                store: 'NastavniPlan',
                forceFit: true,
                columns: [
                    {
                        text: 'Opis',
                        dataIndex: 'opis'
                    },
                    {
                        xtype: 'actioncolumn',
                        width: 20,
                        items: [
                            {
                                icon: 'img/icons/application_form_edit.png',
                                tooltip: 'Izmijeni',
                                iconCls: 'editAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    var view = Ext.widget('nastavniplanform');
                                    view.down('form').loadRecord(Ext.getStore('NastavniPlan').getAt(rowIndex));
                                    view.down('#formNastavniPlanSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('NastavniPlan').getAt(rowIndex).data.opis;
                                    view.renderTo = '#nastavniplanlist';
                                    view.modal = true; // Make window modal so the list is inacesible
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbriši',
                                iconCls: 'deleteAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    /*var userId = Ext.getStore('User').getAt(rowIndex).data.id;
                                    User.delete(userId, function(provider, response) {
                                        //console.log(provider, response);
                                        if(provider.success == true) {
                                            var sm = grid.getSelectionModel();
                                            grid.store.removeAt(rowIndex);
                                        }
                                    })*/
                                }
                            }
                        ]
                    }
                ]
            }
        ];
        
        this.dockedItems = [
            {
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    {
                        xtype: 'button',
                        icon: 'img/icons/add.png',
                        text: 'Dodaj nastavni plan', 
                        id: 'openNastavniPlanForm'
                    }
                    
                ]
            },
            {
                        xtype: 'pagingtoolbar',
                        store: 'NastavniPlan',
                        dock: 'bottom',
                        displayInfo: true
                    }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('nastavniplanlist', Athene.view.nastavniplan.List);