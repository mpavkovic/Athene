Ext.define('Athene.view.adresa.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.adresalist',
    id: 'adresalist',
    
    title: 'Popis adresa (učenika)',
    layout: 'fit',
    width: 1000,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'adresagrid',
                store: 'Adresa',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id',
                        renderer: function(value) {
                            return Ext.getStore('Ucenik').getById(value).data.prezime;
                        }
                    },
                    {
                        text: 'Tip adrese',
                        dataIndex: 'tip_adrese'
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
                        text: 'Datum od',
                        dataIndex: 'datum_od'
                    },
                    {
                        text: 'Datum do',
                        dataIndex: 'datum_do'
                    },
                    {
                        text: 'Telefon',
                        dataIndex: 'telefon'
                    },
                    {
                        text: 'Mobitel',
                        dataIndex: 'mobitel'
                    },
                    {
                        text: 'Stanuje s',
                        dataIndex: 'stanuje_s'
                    },
                    {
                        text: 'Mjesto',
                        dataIndex: 'mjesto_id',
                        renderer: function(value) {
                            return Ext.getStore('Mjesto').getById(value).data.naziv;
                        }
                    },
                    {
                        text: 'Razlog boravišta',
                        dataIndex: 'razlog_boravista_id',
                        renderer: function(value) {
                            return Ext.getStore('RazlogBoravista').getById(value).data.opis;
                        }
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
                        text: 'Dodaj adresa', 
                        id: 'openAdresaForm'
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});