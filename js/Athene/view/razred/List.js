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
    closeAction: 'hide',
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                itemId: 'grid',
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
                                    var view;
                                    if(Ext.WindowManager.get('razredform')) {
                                        view = Ext.WindowManager.get('razredform');
                                    } else {
                                        view = Ext.widget('razredform');
                                        Ext.getCmp('workspace').add(view);
                                    }
                                    view.down('form').loadRecord(grid.store.getAt(rowIndex));
                                    var button = view.down('button[action=save]');
                                    if(button) {
                                        button.setText('Spremi');
                                        button.action = 'update';
                                    }
                                    view.setTitle('Izmijeni: ' + grid.store.getAt(rowIndex).data.naziv);
                                    view.show();
                                }
                            },
                            '-',
                            {
                                icon: 'img/icons/delete.png',
                                tooltip: 'Izbriši',
                                iconCls: 'deleteAction',
                                handler: function(grid, rowIndex, columnIndex) {
                                    grid.store.getAt(rowIndex).destroy({
                                        success: function() {
                                            Ext.widget('notification').popup('Razred usješno izbrisan!');
                                            grid.store.load();
                                        }
                                    });
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
                        text: 'Dodaj izbornik', 
                        itemId: 'openForm'
                    }, {
                        xtype: 'button',
                        icon: 'img/icons/refresh.png',
                        text: 'Osvježi',
                        itemId: 'refresh'
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
// Register custom xtype so we can use it in razred
Ext.ComponentManager.registerType('razredlist', Athene.view.razred.List);