Ext.define('Athene.controller.Menu', {
    extend: 'Ext.app.Controller',
    
    views: [
        'menu.Side'
    ],
    
    init: function() {
        
        this.control({
            'sidemenu': {
                itemclick: function(menu, record) {
                    if(record.data.leaf == true) {
                        _id = record.data.id;
                        _win = _id.substring(_id.lastIndexOf("/")+1);
			
                        var view = Ext.WindowManager.get(_win);
                        if(view === undefined) {
			    if(Ext.ComponentManager.isRegistered(_win)) {
				view = Ext.widget(_win);
				Ext.getCmp('workspace').add(view);
				view.show();
				Ext.widget('popupmessage').popup('Otvoren prozor ' + _win);
			    } else {
				console.error('Widget ' + _win + ' is not registered!');
			    }
                        } else if(!view.isVisible()) {
			    view.show();
			}
                    }
                }
            }
        })
    }
});