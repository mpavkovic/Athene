Ext.define('Athene.MessageBus', {
    extend: 'Ext.util.Observable',
    
    constructor: function() {
        console.log('Initializing message bus!');
        this.addEvents('log');
        this.callParent(arguments);
    }
});

MessageBus = Ext.create('Athene.MessageBus');