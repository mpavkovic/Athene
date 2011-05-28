Ext.define('Athene.controller.Main', {
    extend: 'Ext.app.Controller',
    
    views: [
        'Viewport',
        'PopupMessage'
    ],
    
    
    init: function() {
        
        this.control({
            '#logout': {
                click: function() {
                    console.log('Log me out!');
                    Ext.Ajax.request({
                        url: 'ext.php',
                        method: 'GET',
                        params: {
                            logout: true
                        }
                    });
                    window.location.reload();
                }
            },
			'#openPomocForm': {
                click: this.help
            }
        });
    },
	
    help: function() {
        Ext.Ajax.request({
            url: 'help/index.html',
            success: function(response) {
                var view = Ext.widget('helpwindow');
                view.update(response.responseText);
                view.setTitle(view.title + 'Pomoć pri korištenju aplikacije');
                view.show();
            },
            failure: function() {
                Ext.Msg.alert("Greška", "Nemogu učitati pomoć za zatraženu stavku.");
            }
        })
    }
    
});