import panflute as pf

img_grey = 'media/image1.png'
reps = {
    img_grey: 'pic/grey.png',
    'media/image2.png': 'Si',
    'media/image3.png': 'Fe',
    'media/image4.png': 'Ni',
    'media/image5.png': 'Se',
    'media/image6.png': 'Ti',
    'media/image7.png': 'Fi',
    'media/image8.png': 'Te',
    'media/image9.png': 'Ne',
}


def action(elem, doc):
    if isinstance(elem, pf.Span):
        if 'underline' in elem.classes:
            elem.classes = [cls for cls in elem.classes if cls != 'underline']
    elif isinstance(elem, pf.Image):
        if elem.url == img_grey:
            elem.url = reps[img_grey]
        elif elem.url in reps.keys():
            return [pf.Str(reps[elem.url]),]


def main(doc=None):
    return pf.run_filter(action, doc=doc)


if __name__ == '__main__':
    main()
