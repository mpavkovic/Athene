Ext.define('Athene.store.Razred', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Razred', // Must be full path to model
    proxy: {
        type: 'direct',
        directFn: Razred.getAll
    },
    
    /*filters: [
        {
            
        }
    ]*/
});