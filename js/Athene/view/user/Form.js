Ext.define('Athene.view.user.Form', {
    extend: 'Ext.window.Window',
    alias: 'widget.userform',
    id: 'userform',
    
    title: 'Novi korisnik',
    layout: 'fit',
    width: 300,
    height: 260,
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
		defaultType: 'textfield',
                
                api: {
                    submit: User.save
                },
    
                items: [
                    {
                        name: 'username',
                        fieldLabel: 'Korisničko ime',
                        allowBlank: false
                    },
		    {
			name: 'first_name',
			fieldLabel: 'Ime'
		    },
		    {
			name: 'last_name',
			fieldLabel: 'Prezime'
		    },
		    {
			name: 'email',
			fieldLabel: 'E-mail'
		    },
		    {
			name: 'password',
			fieldLabel: 'Lozinka'
		    }
                ],
                buttons: [
		    {
			text: 'Odustani',
			align: 'left',
			handler: function() {
			    me.close();
			}
		    },
		    {
			xtype: 'tbfill'
		    },
                    {
                        text: 'Dodaj',
			id: 'formUserSubmit',
			scope: me,
                        handler: function() {
			    //console.log(me.down('form'));
                            me.down('form').getForm().submit({
				success: function(form, action) {
				    //Ext.Msg.alert('Success', action.result.msg);
					me.down('form').getForm().reset();
					Ext.widget('notification').popup('Korisnik uspješno dodan.');
				},
	                        failure: function(form, action) {
				    //Ext.Msg.alert('Failed', action.result.msg);
				    Ext.widget('notification').popup({
					message: action.result.message,
					icon: 'img/icons/exclamation.png'
				    });
	                        }
			    })
                        }
                    }
                ]
            }
        ];
        
        this.callParent(arguments);
    }
});