import panflute as pf


def action(elem, doc):
    if isinstance(elem, pf.Span):
        if 'underline' in elem.classes:
            elem.classes = [cls for cls in elem.classes if cls != 'underline']


def main(doc=None):
    return pf.run_filter(action, doc=doc)


if __name__ == '__main__':
    main()
