Ext.define('Athene.view.razred.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.razredlist',
    id: 'razredlist',
    
    title: 'Popis razreda',
    layout: 'fit',
    width: 800,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'razredgrid',
                store: 'Razred',
                forceFit: true,
                columns: [
                    {
                        dataIndex: 'id',
                        text: 'ID'
                    },
                    {
                        dataIndex: 'naziv',
                        text: 'Naziv',
                        flex: 1
                    },
                    {
                        dataIndex: 'skolska_godina_id',
                        text: 'Šk. godina'
                    },
                    {
                        xtype: 'templatecolumn',
                        dataIndex: 'razrednik_id',
                        text: 'Razrednik',
                        tpl: '{razrednik_ime} {razrednik_prezime}'
                    },
                    {
                        dataIndex: 'klasa',
                        text: 'Klasa'
                    },
                    {
                        dataIndex: 'urudzbeni_broj',
                        text: 'Uruđbeni broj'
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
                                    var view = Ext.widget('razredform');
                                    view.down('form').loadRecord(Ext.getStore('Razred').getAt(rowIndex));
                                    view.down('#formRazredSubmit').text = 'Spremi';
                                    view.title = 'Izmijeni: ' + Ext.getStore('Razred').getAt(rowIndex).data.id;
                                    view.renderTo = '#razredlist';
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
                        text: 'Dodaj razred', 
                        id: 'openRazredForm'
                    },
                    '->',
                    {
                        xtype: 'combo',
                        id: 'filterRazredBySkGod',
                        store: 'SkolskaGodina',
                        fieldLabel: 'Školska godina',
                        displayField: 'godina',
                        valueField: 'godina'
                    }
                ]
            },
            {
                xtype: 'pagingtoolbar',
                store: 'Razred',
                dock: 'bottom',
                displayInfo: true
            }
        ]
        
        this.callParent(arguments);
    }
});
// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('razredlist', Athene.view.razred.List);