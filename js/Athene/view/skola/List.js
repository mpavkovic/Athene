Ext.define('Athene.view.skola.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.skolalist',
    id: 'skolalist',
    
    title: 'Popis Škola',
    layout: 'fit',
    width: 800,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'skolagrid',
                store: 'Skola',
                forceFit: true,
                columns: [
                    {
                        text: 'Naziv',
                        dataIndex: 'naziv'
                    },
                    {
                        text: 'Ravnatelj',
                        dataIndex: 'ravnatelj'
                    },
                    {
                        text: 'Mjesto',
                        dataIndex: 'mjesto_id',
                        renderer: function(value) {
                            return Ext.getStore('Mjesto').getById(value).data.naziv;
                        }
                    },
                    {
                        text: 'Ulica',
                        dataIndex: 'ulica'
                    },
                    {
                        text: 'Broj',
                        dataIndex: 'broj'
                    },
                    {
                        text: 'Telefon',
                        dataIndex: 'telefon'
                    },
                    {
                        text: 'Email',
                        dataIndex: 'email'
                    },
                    {
                        text: 'Web sjedište',
                        dataIndex: 'web'
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
                        text: 'Dodaj školu', 
                        id: 'openSkolaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});