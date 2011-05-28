Ext.define('Athene.view.nastavnisat.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.nastavnisatform',
    id: 'nastavnisatform',
    
    title: 'Novi Nastavni Sat',
    layout: 'fit',
    width: 300,
    height: 340,
    constrain: true,
       
    initComponent: function() {
        this.items = [
            {
                xtype: 'form',
                bodyPadding: 5,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: NastavniSat.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatUcitelj',
                        store: 'Ucitelj',
                        fieldLabel: 'Učitelj',
                        displayField: 'prezime',
                        valueField: 'id',
						name: 'ucitelj_id'
                    },
                    {
                        xtype: 'datefield',
                        name: 'datum',
                        fieldLabel: 'Datum',
                        format: 'd.m.Y.',
                        submitFormat: 'Y-m-d',
                        allowBlank: false
                    },
                    {
                        xtype: 'textareafield',
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatMetodskaJedinica',
                        store: 'MetodskaJedinica',
                        fieldLabel: 'Metodska Jedinica',
                        displayField: 'opis',
                        valueField: 'id',
						name: 'metodska_jedinica_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboNastavniSatKategorijaPredRazOdj',
                        store: 'PredmetRazrednogOdjeljenja',
                        fieldLabel: 'Predmet razrednog odjeljenja',
                        displayField: 'predmet_id',
                        valueField: 'id',
						name: 'predmet_razrednog_odjeljenja_id'
                    },
                    {
                        xtype: 'textareafield',
                        name: 'napomena',
                        fieldLabel: 'Napomena',
                        allowBlank: false,
						grow: true,
						anchor: '100%',
						maxLength: 250
                    },
                ],
                buttons: [
                    {
                        text: 'Dodaj',
                        handler: function() {
                            this.up('form').getForm().submit();
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});