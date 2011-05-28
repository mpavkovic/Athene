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
Ext.define('Athene.view.razred.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.razredform',
    id: 'razredform',
    
    title: 'Novi razred',
    layout: 'fit',
    width: 300,
    height: 260,
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
                    submit: Razred.save
                },
    
                items: [
                    {
                        xtype: 'textfield',
                        name: 'naziv',
                        fieldLabel: 'Naziv',
                        allowBlank: false,
			maxLength: 30	
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
                        xtype: 'combo',
                        id: 'comboRazredGodina',
                        store: 'SkolskaGodina',
                        fieldLabel: 'Šk. godina',
                        displayField: 'godina',
                        valueField: 'godina',
						name: 'skolska_godina_id'
                    },
                    {
                        xtype: 'combo',
                        id: 'comboRazredRazrednik',
                        store: 'Ucitelj',
                        fieldLabel: 'Razrednik',
                        displayField: 'prezime',
                        valueField: 'id',
						name: 'razrednik_id'
                    },
                    {
                        xtype: 'textfield',
                        name: 'klasa',
                        fieldLabel: 'Klasa',
                        allowBlank: false,
			maxLength: 200
                    },
                    {
                        xtype: 'textfield',
                        name: 'urudzbeni_broj',
                        fieldLabel: 'Uruđbeni broj',
                        allowBlank: false,
			maxLength: 200
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