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
		    },
		    {
			xtype: 'combo',
			multiSelect: true,
			fieldLabel: 'Grupe',
			store: 'Group',
			displayField: 'name',
			valueField: 'id',
			value: '1',
			listeners: {
			    render: function(v,a,r) {
				console.log(v,a,r);
			    }
			}
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
				    Ext.widget('popupmessage').popup('Korisnik uspješno dodan.');
				    me.close();
				},
	                        failure: function(form, action) {
				    //Ext.Msg.alert('Failed', action.result.msg);
				    Ext.widget('popupmessage').popup({
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