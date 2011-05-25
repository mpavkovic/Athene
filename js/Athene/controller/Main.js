Ext.define('Athene.controller.Main', {
    extend: 'Ext.app.Controller',
    
    views: [
        'Viewport'
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
            }
        });
    }
    
});