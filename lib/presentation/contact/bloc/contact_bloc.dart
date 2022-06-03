import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc({required CompanyRepository companyRepository})
      : _companyRepository = companyRepository,
        super(const ContactState()) {
    on<ContactInitEvent>(_onContactInitEvent);
  }

  final CompanyRepository _companyRepository;

  void _onContactInitEvent(ContactInitEvent event, Emitter<ContactState> emit) {
    var company = _companyRepository.company;

    if (company != null) {
      emit(state.copyWith(company: company));
    }
  }
}
