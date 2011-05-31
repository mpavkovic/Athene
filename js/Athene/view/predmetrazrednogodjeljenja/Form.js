var odabir_polugodista = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"prvo"},
        {"abbr":"2", "naziv":"drugo"},
    ]
});
Ext.define('Athene.view.predmetrazrednogodjeljenja.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetrazrednogodjeljenjaform',
    id: 'predmetrazrednogodjeljenjaform',
    
    title: 'Novi Predmet Razrednog Odjeljenja',
    layout: 'fit',
    width: 300,
    height: 220,
    constrain: true,
       
    initComponent: function() {
	var me = this;
        this.items = [
            {
                xtype: 'form',
                bodyPadding: 5,
                layout: 'anchor',
                defaults: {
                    anchor: '100%'
                },
                
                api: {
                    submit: PredmetRazrednogOdjeljenja.save
                },
    
                items: [
                    {
                        xtype: 'combo',
                        id: 'comboPredmetRazrednogOdjeljenjaRazred',
                        store: 'Razred',
                        fieldLabel: 'Razred',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'razredno_odjeljenje_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboPredmetRazrednogOdjeljenjaPredmet',
                        store: 'Predmet',
                        fieldLabel: 'Predmet',
                        displayField: 'naziv',
                        valueField: 'id',
						name: 'predmet_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboPredmetRazrednogOdjeljenjaUcitelj',
                        store: 'Ucitelj',
                        fieldLabel: 'Učitelj',
                        displayField: 'prezime',
                        valueField: 'id',
						name: 'ucitelj_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboPredmetRazrednogOdjeljenjaPolugodiste',
						fieldLabel: 'Polugodište',
						store: odabir_polugodista,
						queryMode: 'local',
						displayField: 'naziv',
						valueField: 'abbr',
						name: 'polugodiste'
                    },
                    {
                        xtype: 'textfield',
                        name: 'realiziran_broj_sati',
                        fieldLabel: 'Realiziran broj sati',
                        allowBlank: false,
			maxLength: 11
                    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			handler: function() {
			   me.close();
			}
		    },
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