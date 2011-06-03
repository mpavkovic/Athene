Ext.define('Athene.view.menu.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.menulist',
    id: 'menulist',
    
    title: 'Popis izbornika',
    layout: 'fit',
    width: 700,
    minWidth: 700,
    height: 300,
    minHeight: 300,
    maximizable: true,
    constrain: true,
    closeAction: 'hide',
       
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                itemId: 'grid',
                store: 'Menu',
                forceFit: true,
                columns: [
                    {
                        text: 'Label',
                        dataIndex: 'label',
                        flex: 1
                    },
                    {
                        text: 'ext ID',
                        dataIndex: 'ext_id'
                    },
                    {
                        text: 'ext cls',
                        dataIndex: 'ext_cls'
                    },
                    {
                        text: 'ext leaf',
                        dataIndex: 'ext_leaf',
                        width: 20
                    },
                    {
                        text: 'ext expanded',
                        dataIndex: 'ext_expanded',
                        width: 20
                    },
                    {
                        text: 'ext iconCls',
                        dataIndex: 'ext_iconCls'
                    },
                    {
                        text: 'Parent',
                        dataIndex: 'parent',
                        width: 20
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
                                    if(Ext.WindowManager.get('menuform')) {
                                        view = Ext.WindowManager.get('menuform');
                                    } else {
                                        view = Ext.widget('menuform');
                                        Ext.getCmp('workspace').add(view);
                                    }
                                    view.down('form').loadRecord(grid.store.getAt(rowIndex));
                                    var button = view.down('button[action=save]');
                                    if(button) {
                                        button.setText('Spremi');
                                        button.action = 'update';
                                    }
                                    view.setTitle('Izmijeni: ' + grid.store.getAt(rowIndex).data.label);
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
                                            Ext.widget('notification').popup('Izbornik usješno izbrisan!');
                                            grid.store.load();
                                        }
                                    });
                                }
                            }
                        ]
                    }
                ],
                viewConfig: {
                    stripeRows: true
                }
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
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});

// Register custom xtype so we can use it in menu
Ext.ComponentManager.registerType('menulist', Athene.view.menu.List);