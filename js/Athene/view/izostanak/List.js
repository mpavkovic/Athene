Ext.define('Athene.view.izostanak.List', {
    extend: 'Ext.window.Window',
    alias: 'widget.izostanaklist',
    id: 'izostanaklist',
    
    title: 'Popis izostanaka',
    layout: 'fit',
    width: 600,
    height: 300,
    maximizable: true,
    constrain: true,
    
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                id: 'izostanakgrid',
                store: 'Izostanak',
                forceFit: true,
                columns: [
                    {
                        text: 'Učenik',
                        dataIndex: 'ucenik_id'
                    },
                    {
                        text: 'Predmet razrednog odjeljenja',
                        dataIndex: 'predmet_id'
                    },
                    {
                        text: 'Datum',
                        dataIndex: 'datum'
                    },
                    {
                        text: 'Opravdano',
                        dataIndex: 'opravdano'
                    },
                    {
                        text: 'Opravdanje',
                        dataIndex: 'opravdanje'
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
                        icon: 'icons/add.png',
                        text: 'Dodaj izostanak', 
                        id: 'openIzostanakForm',
						tooltip: {text:'Ovo je neki opis nečega'}
                    },
                    {
                        xtype: 'splitbutton',
                        text: 'Predmet',
						tooltip: {text:'Izaberite nešto'},
						menu: {
							items: [
								{
								text: 'Dodaj predmet',
								id: 'openAdresaForm'
								},
								{
								text: 'Popis predmeta'
								}
							]
						}
                    }
                ]
            }
        ]
        
        this.callParent(arguments);
    }
});