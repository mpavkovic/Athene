Ext.define('Athene.store.Ocjena', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Ocjena',
    proxy: {
        type: 'direct',
        directFn: Ocjena.getAll
    },
    sorters: [
        {
            property: 'ocjena'
        }
    ]
});