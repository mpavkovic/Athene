var odabir_ocjene = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"nedovoljan"},
        {"abbr":"2", "naziv":"dovoljan"},
        {"abbr":"3", "naziv":"dobar"},
        {"abbr":"4", "naziv":"vrlo dobar"},
        {"abbr":"5", "naziv":"odličan"},
    ]
});
Ext.define('Athene.view.ocjena.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.ocjenaform',
    id: 'ocjenaform',
    
    title: 'Nova Ocjena',
    layout: 'fit',
    width: 300,
    height: 280,
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
                    submit: Ocjena.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaOcjena',
						fieldLabel: 'Ocjena',
						store: odabir_ocjene,
						queryMode: 'local',
						displayField: 'naziv',
						valueField: 'abbr',
						name: 'ocjena',
						maxLength: 2
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaUcenik',
                        store: 'Ucenik',
                        fieldLabel: 'Učenik',
                        displayField: 'prezime',
                        valueField: 'oib',
						name: 'ucenik_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaPredmetnaCjelina',
                        store: 'PredmetnaCjelina',
                        fieldLabel: 'Predmetna Cjelina',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'predmetna_cjelina_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboOcjenaKategorijaOcjena',
                        store: 'KategorijaOcjena',
                        fieldLabel: 'Kategorija Ocjena',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'kategorija_ocjena_id'
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
                        name: 'opaska',
                        fieldLabel: 'Opaska',
                        allowBlank: false,
						grow: true,
						anchor: '100%'
                    }
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