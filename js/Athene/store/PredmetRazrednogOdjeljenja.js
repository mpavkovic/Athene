Ext.define('Athene.store.PredmetRazrednogOdjeljenja', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.PredmetRazrednogOdjeljenja',
    proxy: {
        type: 'direct',
        directFn: PredmetRazrednogOdjeljenja.getAll
    }
});