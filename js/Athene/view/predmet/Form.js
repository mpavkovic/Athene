var popis_razreda = Ext.create('Ext.data.Store', {
    fields: ['abbr','naziv'],
    data : [
        {"abbr":"1", "naziv":"prvi"},
        {"abbr":"2", "naziv":"drugi"},
        {"abbr":"3", "naziv":"treći"},
        {"abbr":"4", "naziv":"četvrti"},
        {"abbr":"5", "naziv":"peti"},
        {"abbr":"6", "naziv":"šesti"},
        {"abbr":"7", "naziv":"sedmi"},
        {"abbr":"8", "naziv":"osmi"},
    ]
});
Ext.define('Athene.view.predmet.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.predmetform',
    id: 'predmetform',
    
    title: 'Novi Predmet',
    layout: 'fit',
    width: 300,
    height: 190,
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
                    submit: Predmet.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 100
                    },
                    {
                        xtype: 'textfield',
                        name: 'opis',
                        fieldLabel: 'Opis',
                        allowBlank: false
                    },
                    {
                        xtype: 'combo',
                        id: 'comboRazredRazred',
						fieldLabel: 'Razred',
						store: popis_razreda,
						queryMode: 'local',
						displayField: 'naziv',
						valueField: 'abbr',
						name: 'razred'
                    },
                    {
                        xtype: 'textfield',
                        name: 'previdjen_broj_sati',
                        fieldLabel: 'Predviđen broj sati',
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